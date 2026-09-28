"""
LeNet-5  --  LeCun, Bottou, Bengio & Haffner (1998),
"Gradient-Based Learning Applied to Document Recognition", Fig. 2.

Of the three networks in this lab, LeNet-5 needs the least adaptation: it was
designed for 32x32 input, which is exactly the CIFAR resolution. Only two
things change from the publication:

  1. Input channels 1 -> 3   (MNIST is greyscale, CIFAR is RGB)
  2. Output units   10 -> num_classes

Everything else is kept as published, including the two choices that modern
implementations usually replace:

  * tanh activations, not ReLU (ReLU postdates the paper by ~12 years)
  * average pooling, not max pooling

Deviation worth declaring in the report: the paper's C3 layer uses a sparse,
hand-designed connection table so that each of the 16 feature maps sees only
a subset of the 6 preceding maps (Table I in the paper). That asymmetry was
a 1998 compute-budget measure. This implementation uses full connectivity,
as every modern reproduction does; it raises C3's parameter count from 1,516
to 2,416.

Layer-by-layer for 32x32x3 input:

    input            32 x 32 x  3
    C1  conv 5x5 s1  28 x 28 x  6      456 params
    S2  avgpool 2x2  14 x 14 x  6        0
    C3  conv 5x5 s1  10 x 10 x 16    2,416
    S4  avgpool 2x2   5 x  5 x 16        0
    C5  conv 5x5 s1   1 x  1 x120   48,120   (an FC layer in convolutional dress)
    F6  fc            1 x  1 x 84   10,164
    out fc                num_cls       850   (CIFAR-10)
                                    -------
                                     62,006  trainable (CIFAR-10)
"""

import torch.nn as nn


class LeNet5(nn.Module):

    def __init__(self, num_classes: int = 10, in_channels: int = 3):
        super().__init__()

        self.features = nn.Sequential(
            # C1
            nn.Conv2d(in_channels, 6, kernel_size=5, stride=1, padding=0),
            nn.Tanh(),
            # S2
            nn.AvgPool2d(kernel_size=2, stride=2),
            # C3
            nn.Conv2d(6, 16, kernel_size=5, stride=1, padding=0),
            nn.Tanh(),
            # S4
            nn.AvgPool2d(kernel_size=2, stride=2),
            # C5 -- 5x5 kernel on a 5x5 map collapses to 1x1, as in the paper
            nn.Conv2d(16, 120, kernel_size=5, stride=1, padding=0),
            nn.Tanh(),
        )

        self.classifier = nn.Sequential(
            nn.Flatten(),
            # F6
            nn.Linear(120, 84),
            nn.Tanh(),
            # Output. The paper used Euclidean RBF units here; a plain linear
            # layer feeding softmax cross-entropy is the standard modern
            # substitute and is what every reproduction uses.
            nn.Linear(84, num_classes),
        )

    def forward(self, x):
        x = self.features(x)
        return self.classifier(x)
