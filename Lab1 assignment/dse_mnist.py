"""
ELCT918 - Lab Assignment 1
Multi-Objective Design Space Exploration of Neural Network Hyper-Parameters

Exhaustively trains every MLP in a bounded (n, m) design space on MNIST,
computes an implementation cost for each, finds the Pareto-optimal front
between cost and accuracy drop, and plots it.

Framework: PyTorch
Outputs:   runs_raw.csv, results.csv, pareto_front.png
"""

import time

import matplotlib
matplotlib.use("Agg")                       # save plots without needing a display
import matplotlib.pyplot as plt
import pandas as pd
import torch
import torch.nn as nn
from torchvision import datasets

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
LAYER_CHOICES = [1, 2, 3]                   # n: number of hidden layers
NODE_CHOICES  = [10, 20, 40, 80, 160, 200]  # m: nodes per hidden layer
SEEDS         = [0, 1, 2]                   # repeats per configuration

EPOCHS        = 10                          # fixed training budget
BATCH_SIZE    = 200
LEARNING_RATE = 0.1

WEIGHT_UNIT_COST = 139                      # DRAM access, normalized (paper Table 1)
MULT_UNIT_COST   = 1                        # multiply-accumulate, normalized

INPUT_SIZE  = 784                           # 28 x 28 pixels, flattened
NUM_CLASSES = 10

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")


# ---------------------------------------------------------------------------
# Data
# ---------------------------------------------------------------------------
def load_mnist():
    """Load MNIST as flat [0, 1] float tensors, kept entirely on the device."""
    train_set = datasets.MNIST(root="./data", train=True,  download=True)
    test_set  = datasets.MNIST(root="./data", train=False, download=True)

    x_train = train_set.data.view(-1, INPUT_SIZE).float().div(255.0).to(device)
    y_train = train_set.targets.to(device)
    x_test  = test_set.data.view(-1, INPUT_SIZE).float().div(255.0).to(device)
    y_test  = test_set.targets.to(device)
    return x_train, y_train, x_test, y_test


# ---------------------------------------------------------------------------
# Cost model
# ---------------------------------------------------------------------------
def layer_sizes(num_layers, nodes_per_layer):
    """(2, 200) -> [784, 200, 200, 10]"""
    return [INPUT_SIZE] + [nodes_per_layer] * num_layers + [NUM_CLASSES]


def compute_cost(num_layers, nodes_per_layer):
    sizes = layer_sizes(num_layers, nodes_per_layer)
    pairs = list(zip(sizes[:-1], sizes[1:]))           # consecutive (in, out) layers
    n_weights = sum(i * o + o for i, o in pairs)       # weights + biases
    n_mults   = sum(i * o     for i, o in pairs)       # multiplications per inference
    cost = n_weights * WEIGHT_UNIT_COST + n_mults * MULT_UNIT_COST
    return {"weights": n_weights, "mults": n_mults, "cost": cost}


# ---------------------------------------------------------------------------
# Network generator
# ---------------------------------------------------------------------------
def build_model(num_layers, nodes_per_layer):
    """Fully-connected network with `num_layers` hidden layers of `nodes_per_layer` nodes."""
    layers = []
    in_features = INPUT_SIZE
    for _ in range(num_layers):
        layers.append(nn.Linear(in_features, nodes_per_layer))
        layers.append(nn.ReLU())
        in_features = nodes_per_layer
    layers.append(nn.Linear(in_features, NUM_CLASSES))  # logits; softmax is inside the loss
    return nn.Sequential(*layers)


# ---------------------------------------------------------------------------
# Training and evaluation
# ---------------------------------------------------------------------------
def train_and_evaluate(num_layers, nodes_per_layer, data, seed=0):
    x_train, y_train, x_test, y_test = data
    torch.manual_seed(seed)

    model     = build_model(num_layers, nodes_per_layer).to(device)
    optimizer = torch.optim.SGD(model.parameters(), lr=LEARNING_RATE)
    criterion = nn.CrossEntropyLoss()

    n_samples = x_train.shape[0]
    start = time.time()

    model.train()
    for _ in range(EPOCHS):
        perm = torch.randperm(n_samples, device=device)
        for s in range(0, n_samples, BATCH_SIZE):
            idx = perm[s : s + BATCH_SIZE]
            optimizer.zero_grad()
            loss = criterion(model(x_train[idx]), y_train[idx])
            loss.backward()
            optimizer.step()

    train_time = time.time() - start

    model.eval()
    with torch.no_grad():
        preds = model(x_test).argmax(dim=1)
        accuracy = (preds == y_test).float().mean().item() * 100

    return {"test_accuracy": accuracy,
            "accuracy_drop": 100.0 - accuracy,
            "train_time_s": train_time}


# ---------------------------------------------------------------------------
# Pareto front
# ---------------------------------------------------------------------------
def dominates(a, b):
    """True if a is no worse than b on both objectives and strictly better on one."""
    no_worse = a["cost"] <= b["cost"] and a["accuracy_drop"] <= b["accuracy_drop"]
    strictly = a["cost"] <  b["cost"] or  a["accuracy_drop"] <  b["accuracy_drop"]
    return no_worse and strictly


def pareto_mask(df):
    rows = df.to_dict("records")
    return [not any(dominates(other, row) for j, other in enumerate(rows) if j != i)
            for i, row in enumerate(rows)]


# ---------------------------------------------------------------------------
# Plot
# ---------------------------------------------------------------------------
def plot_front(results, path="pareto_front.png"):
    dominated = results[~results["pareto"]]
    optimal   = results[results["pareto"]].sort_values("cost")

    fig, ax = plt.subplots(figsize=(9, 6))
    ax.scatter(dominated["cost"], dominated["accuracy_drop"], c="lightgray",
               edgecolors="gray", s=70, label="Dominated", zorder=2)
    ax.plot(optimal["cost"], optimal["accuracy_drop"], c="crimson",
            lw=1.5, ls="--", alpha=0.7, zorder=3)
    ax.scatter(optimal["cost"], optimal["accuracy_drop"], c="crimson",
               edgecolors="darkred", s=110, label="Pareto-optimal", zorder=4)

    for _, r in results.iterrows():
        ax.annotate(f"({int(r['num_layers'])},{int(r['nodes_per_layer'])})",
                    (r["cost"], r["accuracy_drop"]),
                    textcoords="offset points", xytext=(7, 4), fontsize=8)

    ax.set_xscale("log")
    ax.margins(x=0.08)
    ax.set_xlabel("Implementation cost (normalized units, log scale)")
    ax.set_ylabel("Accuracy drop (%)")
    ax.set_title("MNIST MLP design space: cost vs. accuracy drop\n"
                 f"(mean of {len(SEEDS)} seeds, {EPOCHS} epochs SGD, "
                 f"lr={LEARNING_RATE}, batch={BATCH_SIZE})")
    ax.grid(alpha=0.3, which="both")
    ax.legend()
    fig.tight_layout()
    fig.savefig(path, dpi=200)
    plt.close(fig)


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
def main():
    print(f"Device: {device}")
    data = load_mnist()

    # Sanity checks: cost model vs. hand calculation and vs. the real model
    assert compute_cost(1, 10)["cost"] == 1_114_380
    assert compute_cost(2, 200)["weights"] == 199_210
    assert sum(p.numel() for p in build_model(2, 40).parameters()) \
        == compute_cost(2, 40)["weights"]

    design_space = [(n, m) for n in LAYER_CHOICES for m in NODE_CHOICES]
    print(f"Exploring {len(design_space)} configurations x {len(SEEDS)} seeds\n")

    rows = []
    for n, m in design_space:
        c = compute_cost(n, m)
        for seed in SEEDS:
            r = train_and_evaluate(n, m, data, seed=seed)
            rows.append({"num_layers": n, "nodes_per_layer": m, "seed": seed, **c, **r})
        accs = [row["test_accuracy"] for row in rows[-len(SEEDS):]]
        print(f"n={n} m={m:>3}  cost={c['cost']:>11,}  "
              f"acc={sum(accs)/len(accs):.2f}%  (spread {max(accs)-min(accs):.2f})")

    runs = pd.DataFrame(rows)
    runs.to_csv("runs_raw.csv", index=False)

    results = (runs
        .groupby(["num_layers", "nodes_per_layer", "weights", "mults", "cost"], as_index=False)
        .agg(test_accuracy=("test_accuracy", "mean"),
             accuracy_drop=("accuracy_drop", "mean"),
             acc_std=("test_accuracy", "std"),
             train_time_s=("train_time_s", "mean"))
        .sort_values("cost")
        .reset_index(drop=True))

    results["pareto"] = pareto_mask(results)
    results.to_csv("results.csv", index=False)
    plot_front(results)

    front = results[results["pareto"]]
    print(f"\n{len(front)} of {len(results)} configurations are Pareto-optimal:")
    print(front[["num_layers", "nodes_per_layer", "cost",
                 "test_accuracy", "accuracy_drop"]].to_string(index=False))
    print("\nSaved: runs_raw.csv, results.csv, pareto_front.png")


if __name__ == "__main__":
    main()
