"""
ELCT918 Lab 2 - CIFAR-10 / CIFAR-100 data pipeline.

CIFAR ships only a train split (50k) and a test split (10k). The assignment
asks for training AND validation curves plus a final test accuracy, so:

    50k train  ->  45k train + 5k validation   (val used every epoch)
    10k test   ->  touched exactly once, at the very end

Using the test set as the validation set would leak it into every model-
selection decision and make the reported test accuracy optimistic.

Subtlety worth knowing: augmentation must be applied to the 45k training
subset ONLY. The naive approach -- build one augmented dataset and
random_split it -- silently augments the validation set too, which makes
validation accuracy noisy and consistently pessimistic. This module avoids
that by building two dataset objects over the same underlying data with
different transforms, then indexing both with the same split indices.
"""

import random

import numpy as np
import torch
from torch.utils.data import DataLoader, Subset
from torchvision import datasets, transforms

from config import CONFIG, DATA_DIR, DATASET_STATS, SEED


# --------------------------------------------------------------------------
# Reproducibility
# --------------------------------------------------------------------------
def seed_everything(seed: int = SEED) -> None:
    """Seed every RNG that touches training. Call once, before anything else."""
    random.seed(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    # deterministic cuDNN costs ~10% speed but makes the six runs comparable
    torch.backends.cudnn.deterministic = True
    torch.backends.cudnn.benchmark = False


def _worker_init_fn(worker_id: int) -> None:
    """Give each DataLoader worker a distinct, reproducible seed."""
    worker_seed = (torch.initial_seed() + worker_id) % 2**32
    np.random.seed(worker_seed)
    random.seed(worker_seed)


# --------------------------------------------------------------------------
# Transforms
# --------------------------------------------------------------------------
def build_transforms(dataset: str, augment: bool):
    """Return (train_transform, eval_transform) for the given dataset."""
    stats = DATASET_STATS[dataset]
    normalize = transforms.Normalize(stats["mean"], stats["std"])

    eval_tf = transforms.Compose([
        transforms.ToTensor(),
        normalize,
    ])

    if augment:
        train_tf = transforms.Compose([
            transforms.RandomCrop(32, padding=4),   # translation invariance
            transforms.RandomHorizontalFlip(),      # CIFAR classes are mirror-safe
            transforms.ToTensor(),
            normalize,
        ])
    else:
        train_tf = eval_tf

    return train_tf, eval_tf


# --------------------------------------------------------------------------
# Loaders
# --------------------------------------------------------------------------
def get_dataloaders(dataset: str, cfg=CONFIG, download: bool = True):
    """
    Build train / validation / test DataLoaders for 'cifar10' or 'cifar100'.

    Returns
    -------
    train_loader, val_loader, test_loader, num_classes
    """
    if dataset not in DATASET_STATS:
        raise ValueError(f"unknown dataset {dataset!r}; expected one of {list(DATASET_STATS)}")

    DATA_DIR.mkdir(parents=True, exist_ok=True)
    ds_cls = datasets.CIFAR10 if dataset == "cifar10" else datasets.CIFAR100
    train_tf, eval_tf = build_transforms(dataset, cfg.augment)

    # Two views of the SAME 50k images, differing only in transform.
    full_train_aug = ds_cls(DATA_DIR, train=True, download=download, transform=train_tf)
    full_train_raw = ds_cls(DATA_DIR, train=True, download=False,  transform=eval_tf)
    test_set = ds_cls(DATA_DIR, train=False, download=download, transform=eval_tf)

    # One shuffled permutation, reused for both views -> no overlap, no leakage.
    n_total = len(full_train_aug)
    generator = torch.Generator().manual_seed(SEED)
    perm = torch.randperm(n_total, generator=generator).tolist()
    val_idx = perm[:cfg.val_size]
    train_idx = perm[cfg.val_size:]

    train_set = Subset(full_train_aug, train_idx)   # augmented
    val_set = Subset(full_train_raw, val_idx)       # NOT augmented

    common = dict(
        num_workers=cfg.num_workers,
        pin_memory=torch.cuda.is_available(),
        worker_init_fn=_worker_init_fn,
        persistent_workers=cfg.num_workers > 0,
    )

    train_loader = DataLoader(
        train_set, batch_size=cfg.batch_size, shuffle=True, drop_last=False, **common
    )
    val_loader = DataLoader(
        val_set, batch_size=cfg.batch_size * 2, shuffle=False, **common
    )
    test_loader = DataLoader(
        test_set, batch_size=cfg.batch_size * 2, shuffle=False, **common
    )

    return train_loader, val_loader, test_loader, DATASET_STATS[dataset]["num_classes"]


# --------------------------------------------------------------------------
# Self-check: python data.py
# --------------------------------------------------------------------------
if __name__ == "__main__":
    seed_everything()
    for name in ("cifar10", "cifar100"):
        tr, va, te, nc = get_dataloaders(name)
        xb, yb = next(iter(tr))
        print(f"{name}: {nc} classes | "
              f"train {len(tr.dataset)} | val {len(va.dataset)} | test {len(te.dataset)}")
        print(f"  batch {tuple(xb.shape)} {xb.dtype} | "
              f"mean {xb.mean():+.3f} std {xb.std():.3f} | "
              f"labels {int(yb.min())}..{int(yb.max())}")
