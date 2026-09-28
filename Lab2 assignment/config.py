"""
ELCT918 Lab 2 - Shared configuration.

Task 1 requires that training settings be IDENTICAL across LeNet-5, AlexNet
and VGG16 within a given dataset, so that measured differences reflect
architecture rather than training setup. Every hyperparameter therefore
lives in this one file and nothing here is ever overridden per-model.
"""

from dataclasses import dataclass, asdict, field
from pathlib import Path


# --------------------------------------------------------------------------
# Reproducibility
# --------------------------------------------------------------------------
SEED = 42

# --------------------------------------------------------------------------
# Paths
# --------------------------------------------------------------------------
ROOT = Path(__file__).resolve().parent
DATA_DIR = ROOT / "data"          # torchvision downloads CIFAR here
RESULTS_DIR = ROOT / "results"    # history JSON + curves
CKPT_DIR = ROOT / "checkpoints"   # per-epoch checkpoints (Colab-safe)

# --------------------------------------------------------------------------
# Dataset statistics (channel-wise mean/std over the 50k training images)
# --------------------------------------------------------------------------
DATASET_STATS = {
    "cifar10": {
        "mean": (0.4914, 0.4822, 0.4465),
        "std":  (0.2470, 0.2435, 0.2616),
        "num_classes": 10,
    },
    "cifar100": {
        "mean": (0.5071, 0.4865, 0.4409),
        "std":  (0.2673, 0.2564, 0.2762),
        "num_classes": 100,
    },
}


@dataclass
class TrainConfig:
    """The shared training recipe. Same object for all six runs."""

    # ---- Data -------------------------------------------------------------
    batch_size: int = 128
    val_size: int = 5_000          # carved out of the 50k train split
    num_workers: int = 2           # Colab gives 2 usable CPU cores
    augment: bool = True           # RandomCrop(32, pad=4) + RandomHorizontalFlip

    # ---- Optimiser --------------------------------------------------------
    # SGD (not Adam) is deliberate: VGG16 without BatchNorm diverges under
    # Adam at 1e-3, and the shared-hyperparameter rule means the recipe must
    # be chosen for the most fragile model. These are the values used in
    # Simonyan & Zisserman (2014), Sec. 3.1.
    optimizer: str = "sgd"
    lr: float = 0.01
    momentum: float = 0.9
    weight_decay: float = 5e-4
    nesterov: bool = False

    # ---- Schedule ---------------------------------------------------------
    epochs: int = 50
    lr_milestones: tuple = (25, 40)   # MultiStepLR
    lr_gamma: float = 0.1

    # ---- Runtime ----------------------------------------------------------
    amp: bool = True               # mixed precision; ~1.6x faster on a T4
    grad_clip: float = 0.0         # 0 disables. See note below.

    def to_dict(self):
        return asdict(self)


# NOTE on grad_clip: left at 0 (disabled) so the recipe stays faithful to the
# original papers. If strict VGG16 produces NaN loss in the first epochs,
# set this to 1.0 -- but then set it for ALL six runs, not just VGG16, or the
# comparison is no longer controlled.


CONFIG = TrainConfig()

# Models registered here are discovered by train.py and compare_arch.py.
MODEL_NAMES = ("lenet5", "alexnet", "vgg16")
DATASET_NAMES = ("cifar10", "cifar100")
