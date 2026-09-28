"""
Model registry.

build_model(name, num_classes) is the only entry point train.py and
compare_arch.py use, so adding AlexNet and VGG16 later means registering them
here and nothing else changes.
"""

import torch.nn as nn

from .lenet import LeNet5
from .alexnet import AlexNet
from .vgg16 import VGG16

_REGISTRY = {
    "lenet5": LeNet5,
    "alexnet": AlexNet,
    "vgg16": VGG16,
}


def init_weights(module: nn.Module) -> None:
    """
    Xavier/Glorot initialisation, applied uniformly to all three networks.

    This matters most for VGG16. Simonyan & Zisserman (2014) Sec. 3.1 trained
    the deep configurations by initialising from a pre-trained 11-layer net,
    then noted that random initialisation via Glorot & Bengio (2010) removes
    the need for that pre-training stage. Using Xavier here is therefore
    faithful to the paper, not a departure from it -- and without it, VGG16
    with no BatchNorm sits at chance accuracy forever.

    Applying the same scheme to LeNet-5 and AlexNet keeps initialisation out
    of the set of variables that differ between the three models.
    """
    if isinstance(module, (nn.Conv2d, nn.Linear)):
        nn.init.xavier_normal_(module.weight)
        if module.bias is not None:
            nn.init.zeros_(module.bias)


def build_model(name: str, num_classes: int) -> nn.Module:
    """Instantiate a registered architecture with weights initialised."""
    key = name.lower()
    if key not in _REGISTRY:
        raise ValueError(
            f"unknown model {name!r}; registered: {sorted(_REGISTRY)}"
        )
    model = _REGISTRY[key](num_classes=num_classes)
    model.apply(init_weights)
    return model


def available_models():
    return sorted(_REGISTRY)
