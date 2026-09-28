"""
Task 2, Steps 3 and 4 -- curves and results tables.

Reads every results/<model>_<dataset>_history.json written by train.py and
produces:

  results/curves_<model>_<dataset>.png   loss + accuracy, train vs validation
  results/comparison_<dataset>.png       all three networks on one axis
  results/results.md                     final metrics + accuracy-drop table

Runs on whatever histories exist, so it is useful mid-way through the six
runs, not only at the end.

    python plot_results.py
"""

import json

import matplotlib
matplotlib.use("Agg")                     # headless: no display in Colab
import matplotlib.pyplot as plt

from config import RESULTS_DIR, MODEL_NAMES, DATASET_NAMES


def load_histories():
    """Return {(model, dataset): history} for every history JSON present."""
    found = {}
    for path in sorted(RESULTS_DIR.glob("*_history.json")):
        h = json.loads(path.read_text())
        found[(h["model"], h["dataset"])] = h
    return found


# --------------------------------------------------------------------------
# Per-run curves
# --------------------------------------------------------------------------
def plot_run(h):
    tag = f"{h['model']}_{h['dataset']}"
    ep = h["epoch"]
    fig, (ax_loss, ax_acc) = plt.subplots(1, 2, figsize=(12, 4.5))

    ax_loss.plot(ep, h["train_loss"], label="train")
    ax_loss.plot(ep, h["val_loss"], label="validation")
    ax_loss.set_xlabel("epoch"); ax_loss.set_ylabel("cross-entropy loss")
    ax_loss.set_title(f"{h['model']} on {h['dataset']} — loss")
    ax_loss.legend(); ax_loss.grid(alpha=0.3)

    ax_acc.plot(ep, h["train_acc"], label="train top-1")
    ax_acc.plot(ep, h["val_top1"], label="validation top-1")
    if h["dataset"] == "cifar100":
        ax_acc.plot(ep, h["val_top5"], label="validation top-5", linestyle="--")
    ax_acc.set_xlabel("epoch"); ax_acc.set_ylabel("accuracy (%)")
    ax_acc.set_title(f"{h['model']} on {h['dataset']} — accuracy")
    ax_acc.legend(); ax_acc.grid(alpha=0.3)

    fig.tight_layout()
    out = RESULTS_DIR / f"curves_{tag}.png"
    fig.savefig(out, dpi=140)
    plt.close(fig)
    return out


# --------------------------------------------------------------------------
# Cross-model comparison, one figure per dataset
# --------------------------------------------------------------------------
def plot_dataset_comparison(histories, dataset):
    runs = [(m, histories[(m, dataset)]) for m in MODEL_NAMES
            if (m, dataset) in histories]
    if not runs:
        return None

    fig, (ax_val, ax_gap) = plt.subplots(1, 2, figsize=(12, 4.5))
    for name, h in runs:
        ax_val.plot(h["epoch"], h["val_top1"], label=name)
        ax_gap.plot(h["epoch"], h["train_val_gap"], label=name)

    ax_val.set_xlabel("epoch"); ax_val.set_ylabel("validation top-1 (%)")
    ax_val.set_title(f"{dataset} — validation accuracy")
    ax_val.legend(); ax_val.grid(alpha=0.3)

    # Positive gap = training accuracy exceeds validation accuracy.
    # Starts negative because augmentation and dropout make the training
    # pass harder than evaluation; the crossover is where memorisation begins.
    ax_gap.axhline(0, color="black", linewidth=0.8)
    ax_gap.set_xlabel("epoch"); ax_gap.set_ylabel("train − validation top-1 (pp)")
    ax_gap.set_title(f"{dataset} — generalisation gap")
    ax_gap.legend(); ax_gap.grid(alpha=0.3)

    fig.tight_layout()
    out = RESULTS_DIR / f"comparison_{dataset}.png"
    fig.savefig(out, dpi=140)
    plt.close(fig)
    return out


# --------------------------------------------------------------------------
# Tables
# --------------------------------------------------------------------------
def results_markdown(histories):
    lines = ["# Results (Task 2, Steps 3-4)", ""]

    for dataset in DATASET_NAMES:
        runs = [(m, histories[(m, dataset)]) for m in MODEL_NAMES
                if (m, dataset) in histories and "test_top1" in histories[(m, dataset)]]
        if not runs:
            continue

        lines += [
            f"## {dataset}", "",
            "| Network | Params | Best val top-1 | Test top-1 | Test top-5 | "
            "Accuracy drop | Final gap | Train time/epoch |",
            "|---|---|---|---|---|---|---|---|",
        ]
        for name, h in runs:
            lines.append(
                f"| {name} | {h['trainable_params']:,} | {h['best_val_top1']:.2f}% | "
                f"{h['test_top1']:.2f}% | {h['test_top5']:.2f}% | "
                f"{h['accuracy_drop']:.2f}% | {h['train_val_gap'][-1]:+.2f} pp | "
                f"{h['mean_train_time_sec']:.1f} s |"
            )
        lines.append("")

    # Step 4 asks explicitly for accuracy drop = 100 - test accuracy, all six runs
    done = [(m, d, histories[(m, d)]) for d in DATASET_NAMES for m in MODEL_NAMES
            if (m, d) in histories and "test_top1" in histories[(m, d)]]
    if done:
        lines += [
            "## Accuracy drop (100 − test top-1)", "",
            "| Network | Dataset | Test top-1 | Accuracy drop |",
            "|---|---|---|---|",
        ]
        for m, d, h in done:
            lines.append(f"| {m} | {d} | {h['test_top1']:.2f}% | {h['accuracy_drop']:.2f}% |")
        lines.append("")

    return "\n".join(lines)


def main():
    histories = load_histories()
    if not histories:
        print(f"no history files in {RESULTS_DIR} — run train.py first")
        return

    print(f"found {len(histories)} run(s): "
          + ", ".join(f"{m}/{d}" for m, d in sorted(histories)))

    for h in histories.values():
        print(f"  wrote {plot_run(h).name}")

    for dataset in DATASET_NAMES:
        out = plot_dataset_comparison(histories, dataset)
        if out:
            print(f"  wrote {out.name}")

    text = results_markdown(histories)
    (RESULTS_DIR / "results.md").write_text(text)
    print("\n" + text)
    print(f"-> {RESULTS_DIR / 'results.md'}")


if __name__ == "__main__":
    main()
