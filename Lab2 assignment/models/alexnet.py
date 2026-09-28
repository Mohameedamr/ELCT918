"""
AlexNet  --  Krizhevsky, Sutskever & Hinton (2012),
"ImageNet Classification with Deep Convolutional Neural Networks".

ADAPTATION -- this is the network that needs the most justification.

The published network expects 224x224 input and opens with an 11x11
convolution at stride 4, followed immediately by a 3x3 max-pool at stride 2.
On a 32x32 CIFAR image that stem is destructive: 32 -> 6 after conv1,
-> 2 after pool1. Two pixels of spatial extent remain before conv2, and the
remaining three convolutional layers have essentially nothing left to work on.

Two ways out:

  (a) Upsample CIFAR to 224x224 and keep AlexNet verbatim. Faithful, but
      ~49x the compute per image, and it would make AlexNet incomparable to
      the other two networks, which run at native 32x32.

  (b) Rescale the stem to the input resolution, keeping the network's
      identity -- 5 convolutional layers, 3 fully-connected layers, the same
      channel progression (96, 256, 384, 384, 256) and the same three
      pooling stages -- but with kernel sizes and strides appropriate to a
      32x32 image.

This implementation takes (b), which is the standard "CIFAR-AlexNet"
treatment. What changes:

    conv1   11x11 stride 4  ->  3x3 stride 1, padding 1
    pooling 3x3  stride 2   ->  2x2 stride 2 (non-overlapping)

What is preserved: layer count and ordering, channel widths, ReLU, local
response normalisation after conv1 and conv2, 3x3 convolutions in conv3-5,
dropout 0.5 on the first two fully-connected layers, and the 4096-unit
fully-connected width.

Note on LRN: local response normalisation was dropped by the community
within a couple of years of the paper as ineffective. It is kept here
because the assignment asks for the published architecture, and its cost is
negligible.

Layer-by-layer for 32x32x3 input:

    input                  32 x 32 x   3
    conv1  3x3 s1 p1       32 x 32 x  96        2,688
    LRN + ReLU
    pool1  2x2 s2          16 x 16 x  96            0
    conv2  5x5 s1 p2       16 x 16 x 256      614,656
    LRN + ReLU
    pool2  2x2 s2           8 x  8 x 256            0
    conv3  3x3 s1 p1        8 x  8 x 384      885,120
    conv4  3x3 s1 p1        8 x  8 x 384    1,327,488
    conv5  3x3 s1 p1        8 x  8 x 256      884,992
    pool3  2x2 s2           4 x  4 x 256            0   -> flatten 4,096
    fc6    dropout+4096            4096   16,781,312
    fc7    dropout+4096            4096   16,781,312
    fc8                         num_cls       40,970   (CIFAR-10)
                                           ----------
                                           37,318,538  trainable (CIFAR-10)
"""

import torch.nn as nn


class AlexNet(nn.Module):

    def __init__(self, num_classes: int = 10, in_channels: int = 3, dropout: float = 0.5):
        super().__init__()

        self.features = nn.Sequential(
            # conv1 -- rescaled stem (see module docstring)
            nn.Conv2d(in_channels, 96, kernel_size=3, stride=1, padding=1),
            nn.ReLU(inplace=True),
            nn.LocalResponseNorm(size=5, alpha=1e-4, beta=0.75, k=2.0),
            nn.MaxPool2d(kernel_size=2, stride=2),          # 32 -> 16

            # conv2
            nn.Conv2d(96, 256, kernel_size=5, stride=1, padding=2),
            nn.ReLU(inplace=True),
            nn.LocalResponseNorm(size=5, alpha=1e-4, beta=0.75, k=2.0),
            nn.MaxPool2d(kernel_size=2, stride=2),          # 16 -> 8

            # conv3, conv4, conv5 -- unchanged from the paper
            nn.Conv2d(256, 384, kernel_size=3, stride=1, padding=1),
            nn.ReLU(inplace=True),
            nn.Conv2d(384, 384, kernel_size=3, stride=1, padding=1),
            nn.ReLU(inplace=True),
            nn.Conv2d(384, 256, kernel_size=3, stride=1, padding=1),
            nn.ReLU(inplace=True),
            nn.MaxPool2d(kernel_size=2, stride=2),          # 8 -> 4
        )

        self.classifier = nn.Sequential(
            nn.Flatten(),
            nn.Dropout(p=dropout),
            nn.Linear(256 * 4 * 4, 4096),
            nn.ReLU(inplace=True),
            nn.Dropout(p=dropout),
            nn.Linear(4096, 4096),
            nn.ReLU(inplace=True),
            nn.Linear(4096, num_classes),
        )

    def forward(self, x):
        x = self.features(x)
        return self.classifier(x)
