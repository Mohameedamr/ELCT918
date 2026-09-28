"""
ELCT918 Lab 2 - model-agnostic training harness.

Deliberately knows nothing about which architecture it is training. Every
hyperparameter comes from config.py, so all six runs share one recipe and any
difference in the results is attributable to architecture.

Usage
-----
    python train.py --model lenet5 --dataset cifar10
    python train.py --model vgg16  --dataset cifar100 --ckpt-dir /content/drive/MyDrive/elct918

Outputs
-------
    results/<model>_<dataset>_history.json   per-epoch metrics + final test scores
    <ckpt-dir>/<model>_<dataset>_last.pt     resume point, written every epoch
    <ckpt-dir>/<model>_<dataset>_best.pt     best validation top-1

The test set is evaluated exactly once, at the end, using the best-validation
checkpoint. It is never used to choose anything.
"""

import argparse
import json
import time
from pathlib import Path

import torch
import torch.nn as nn

from config import CONFIG, CKPT_DIR, RESULTS_DIR, SEED, DATASET_NAMES
from data import get_dataloaders, seed_everything
from models import build_model, available_models


# --------------------------------------------------------------------------
# AMP compatibility: torch.amp.* is the current API, torch.cuda.amp.* the old
# one. Colab's torch version moves around, so support both.
# --------------------------------------------------------------------------
def make_amp(device_type: str, enabled: bool):
    try:
        scaler = torch.amp.GradScaler(device_type, enabled=enabled)
        autocast = lambda: torch.amp.autocast(device_type, enabled=enabled)
    except (AttributeError, TypeError):
        scaler = torch.cuda.amp.GradScaler(enabled=enabled)
        autocast = lambda: torch.cuda.amp.autocast(enabled=enabled)
    return scaler, autocast


# --------------------------------------------------------------------------
# Metrics
# --------------------------------------------------------------------------
@torch.no_grad()
def topk_correct(logits: torch.Tensor, targets: torch.Tensor, ks=(1, 5)):
    """Number of samples whose true label is among the top-k predictions."""
    maxk = min(max(ks), logits.size(1))
    _, pred = logits.topk(maxk, dim=1, largest=True, sorted=True)   # (B, maxk)
    hits = pred.eq(targets.view(-1, 1))                             # (B, maxk)
    return {k: hits[:, :min(k, maxk)].any(dim=1).sum().item() for k in ks}


def count_parameters(model: nn.Module) -> int:
    return sum(p.numel() for p in model.parameters() if p.requires_grad)


# --------------------------------------------------------------------------
# One epoch
# --------------------------------------------------------------------------
def train_one_epoch(model, loader, criterion, optimizer, scaler, autocast, device):
    model.train()
    running_loss, correct1, seen = 0.0, 0, 0

    for images, targets in loader:
        images = images.to(device, non_blocking=True)
        targets = targets.to(device, non_blocking=True)

        optimizer.zero_grad(set_to_none=True)
        with autocast():
            logits = model(images)
            loss = criterion(logits, targets)

        scaler.scale(loss).backward()
        if CONFIG.grad_clip > 0:
            scaler.unscale_(optimizer)
            nn.utils.clip_grad_norm_(model.parameters(), CONFIG.grad_clip)
        scaler.step(optimizer)
        scaler.update()

        batch = targets.size(0)
        running_loss += loss.item() * batch
        correct1 += topk_correct(logits.detach().float(), targets, ks=(1,))[1]
        seen += batch

    return running_loss / seen, 100.0 * correct1 / seen


@torch.no_grad()
def evaluate(model, loader, criterion, autocast, device):
    model.eval()
    running_loss, c1, c5, seen = 0.0, 0, 0, 0

    for images, targets in loader:
        images = images.to(device, non_blocking=True)
        targets = targets.to(device, non_blocking=True)

        with autocast():
            logits = model(images)
            loss = criterion(logits, targets)

        hits = topk_correct(logits.float(), targets, ks=(1, 5))
        batch = targets.size(0)
        running_loss += loss.item() * batch
        c1 += hits[1]
        c5 += hits[5]
        seen += batch

    return running_loss / seen, 100.0 * c1 / seen, 100.0 * c5 / seen


# --------------------------------------------------------------------------
# Main
# --------------------------------------------------------------------------
def main():
    parser = argparse.ArgumentParser(description="ELCT918 Lab 2 trainer")
    parser.add_argument("--model", required=True, choices=available_models())
    parser.add_argument("--dataset", required=True, choices=DATASET_NAMES)
    parser.add_argument("--epochs", type=int, default=None,
                        help="override config.epochs (for smoke tests only)")
    parser.add_argument("--ckpt-dir", type=Path, default=CKPT_DIR,
                        help="point at Google Drive to survive Colab disconnects")
    parser.add_argument("--resume", action="store_true",
                        help="continue from <model>_<dataset>_last.pt if present")
    parser.add_argument("--no-amp", action="store_true")
    args = parser.parse_args()

    cfg = CONFIG
    epochs = args.epochs or cfg.epochs
    tag = f"{args.model}_{args.dataset}"

    seed_everything(SEED)
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    use_amp = cfg.amp and not args.no_amp and device.type == "cuda"
    scaler, autocast = make_amp(device.type, use_amp)

    args.ckpt_dir.mkdir(parents=True, exist_ok=True)
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)

    # ---- data, model, optimiser ------------------------------------------
    train_loader, val_loader, test_loader, num_classes = get_dataloaders(args.dataset, cfg)
    model = build_model(args.model, num_classes).to(device)
    n_params = count_parameters(model)

    criterion = nn.CrossEntropyLoss()
    optimizer = torch.optim.SGD(
        model.parameters(),
        lr=cfg.lr,
        momentum=cfg.momentum,
        weight_decay=cfg.weight_decay,
        nesterov=cfg.nesterov,
    )
    scheduler = torch.optim.lr_scheduler.MultiStepLR(
        optimizer, milestones=list(cfg.lr_milestones), gamma=cfg.lr_gamma
    )

    print(f"\n{'='*66}")
    print(f"  {args.model}  |  {args.dataset}  ({num_classes} classes)")
    print(f"  device {device.type}  |  AMP {use_amp}  |  {n_params:,} trainable params")
    print(f"  SGD lr={cfg.lr} mom={cfg.momentum} wd={cfg.weight_decay} "
          f"| bs={cfg.batch_size} | {epochs} epochs")
    print(f"{'='*66}\n")

    history = {
        "model": args.model,
        "dataset": args.dataset,
        "num_classes": num_classes,
        "trainable_params": n_params,
        "config": cfg.to_dict(),
        "epochs_requested": epochs,
        "epoch": [], "lr": [],
        "train_loss": [], "train_acc": [],
        "val_loss": [], "val_top1": [], "val_top5": [],
        "train_val_gap": [],          # Step 4 asks which net overfits most
        "train_time_sec": [],         # Step 3 asks for training time per epoch
        "epoch_time_sec": [],
    }

    start_epoch, best_val = 0, -1.0
    last_ckpt = args.ckpt_dir / f"{tag}_last.pt"
    best_ckpt = args.ckpt_dir / f"{tag}_best.pt"

    if args.resume and last_ckpt.exists():
        state = torch.load(last_ckpt, map_location=device, weights_only=False)
        model.load_state_dict(state["model"])
        optimizer.load_state_dict(state["optimizer"])
        scheduler.load_state_dict(state["scheduler"])
        scaler.load_state_dict(state["scaler"])
        history = state["history"]
        start_epoch = state["epoch"] + 1
        best_val = state["best_val"]
        print(f"resumed from epoch {start_epoch} (best val top-1 {best_val:.2f}%)\n")

    # ---- training loop ----------------------------------------------------
    for epoch in range(start_epoch, epochs):
        t0 = time.time()
        tr_loss, tr_acc = train_one_epoch(
            model, train_loader, criterion, optimizer, scaler, autocast, device
        )
        if device.type == "cuda":
            torch.cuda.synchronize()
        t_train = time.time() - t0

        va_loss, va_top1, va_top5 = evaluate(model, val_loader, criterion, autocast, device)
        t_epoch = time.time() - t0
        lr_now = optimizer.param_groups[0]["lr"]
        scheduler.step()

        history["epoch"].append(epoch + 1)
        history["lr"].append(lr_now)
        history["train_loss"].append(tr_loss)
        history["train_acc"].append(tr_acc)
        history["val_loss"].append(va_loss)
        history["val_top1"].append(va_top1)
        history["val_top5"].append(va_top5)
        history["train_val_gap"].append(tr_acc - va_top1)
        history["train_time_sec"].append(t_train)
        history["epoch_time_sec"].append(t_epoch)

        print(f"ep {epoch+1:3d}/{epochs} | lr {lr_now:.4f} | "
              f"train {tr_loss:.3f}/{tr_acc:5.2f}% | "
              f"val {va_loss:.3f}/{va_top1:5.2f}% (top5 {va_top5:5.2f}%) | "
              f"gap {tr_acc - va_top1:+5.2f} | {t_train:5.1f}s")

        state = {
            "epoch": epoch, "model": model.state_dict(),
            "optimizer": optimizer.state_dict(), "scheduler": scheduler.state_dict(),
            "scaler": scaler.state_dict(), "history": history, "best_val": best_val,
        }
        torch.save(state, last_ckpt)

        if va_top1 > best_val:
            best_val = va_top1
            state["best_val"] = best_val
            torch.save(state, best_ckpt)

        # written every epoch so a dropped session never loses the curves
        (RESULTS_DIR / f"{tag}_history.json").write_text(json.dumps(history, indent=2))

    # ---- final test: best-validation weights, one pass, never tuned on ----
    if best_ckpt.exists():
        model.load_state_dict(torch.load(best_ckpt, map_location=device, weights_only=False)["model"])
    te_loss, te_top1, te_top5 = evaluate(model, test_loader, criterion, autocast, device)

    history["best_val_top1"] = best_val
    history["test_loss"] = te_loss
    history["test_top1"] = te_top1
    history["test_top5"] = te_top5
    history["accuracy_drop"] = 100.0 - te_top1        # Step 4 table
    history["mean_train_time_sec"] = (
        sum(history["train_time_sec"]) / len(history["train_time_sec"])
    )
    (RESULTS_DIR / f"{tag}_history.json").write_text(json.dumps(history, indent=2))

    print(f"\n{'-'*66}")
    print(f"  TEST  top-1 {te_top1:.2f}%   top-5 {te_top5:.2f}%   "
          f"accuracy drop {100-te_top1:.2f}%")
    print(f"  mean training time/epoch  {history['mean_train_time_sec']:.1f}s")
    print(f"  -> results/{tag}_history.json")
    print(f"{'-'*66}\n")


if __name__ == "__main__":
    main()
