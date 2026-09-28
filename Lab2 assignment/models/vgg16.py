"""
VGG16  --  Simonyan & Zisserman (2014),
"Very Deep Convolutional Networks for Large-Scale Image Recognition",
configuration D (16 weight layers: 13 convolutional + 3 fully-connected).

ADAPTATION -- minimal, because the architecture happens to survive the
resolution change cleanly.

VGG16 is built from 3x3 convolutions with padding 1, which preserve spatial
size, and five 2x2 max-pool stages, each halving it. On the paper's 224x224
input the conv stack ends at 7x7x512. On a 32x32 CIFAR image:

    32 -> 16 -> 8 -> 4 -> 2 -> 1

so it ends at 1x1x512. Nothing needs restructuring -- the five pooling
stages fit exactly, which is why VGG16 is the usual choice for CIFAR
experiments despite being designed for ImageNet.

The only forced change is the classifier input width: 512 instead of
7*7*512 = 25088.

DELIBERATELY NOT CHANGED -- two decisions worth defending in the report:

  1. No BatchNorm. BatchNorm postdates this paper by a year; configuration D
     as published has none. This makes the network genuinely hard to train
     from scratch, which is why initialisation matters so much here (see
     models/__init__.py -- Xavier, per the paper's own Sec. 3.1 remark).

  2. The 4096-unit fully-connected head is kept. On CIFAR this means a
     512 -> 4096 -> 4096 -> num_classes classifier holding ~18.9M parameters,
     sitting on top of a 512-value feature vector -- roughly 56% of the whole
     network devoted to classifying an input it has already compressed.
     Shrinking it to 512 -> 512 would be the sensible engineering choice and
     is what most CIFAR reproductions do. It is kept at 4096 because Task 2
     Step 4 asks specifically about VGG16's capacity relative to the dataset
     size and where overfitting appears; a reduced head would remove the
     phenomenon being measured.

Layer-by-layer for 32x32x3 input (conv layers are all 3x3 stride 1 pad 1):

    input                32 x 32 x   3
    conv1_1 / conv1_2    32 x 32 x  64        38,720
    maxpool              16 x 16 x  64
    conv2_1 / conv2_2    16 x 16 x 128       221,440
    maxpool               8 x  8 x 128
    conv3_1..conv3_3      8 x  8 x 256     1,475,328
    maxpool               4 x  4 x 256
    conv4_1..conv4_3      4 x  4 x 512     5,899,776
    maxpool               2 x  2 x 512
    conv5_1..conv5_3      2 x  2 x 512     7,079,424
    maxpool               1 x  1 x 512   -> flatten 512
                                        ------------
                              conv total   14,714,688
    fc6   dropout + 4096         4096      2,101,248
    fc7   dropout + 4096         4096     16,781,312
    fc8                       num_cls         40,970   (CIFAR-10)
                                        ------------
                                          33,638,218  trainable (CIFAR-10)
"""

import torch.nn as nn


# Configuration D from Table 1 of the paper. 'M' denotes a max-pool stage.
CFG_D = [
    64, 64, "M",
    128, 128, "M",
    256, 256, 256, "M",
    512, 512, 512, "M",
    512, 512, 512, "M",
]


def _make_layers(cfg, in_channels: int = 3):
    layers = []
    channels = in_channels
    for item in cfg:
        if item == "M":
            layers.append(nn.MaxPool2d(kernel_size=2, stride=2))
        else:
            layers.append(nn.Conv2d(channels, item, kernel_size=3, stride=1, padding=1))
            layers.append(nn.ReLU(inplace=True))
            channels = item
    return nn.Sequential(*layers), channels


class VGG16(nn.Module):

    def __init__(self, num_classes: int = 10, in_channels: int = 3, dropout: float = 0.5):
        super().__init__()

        self.features, out_channels = _make_layers(CFG_D, in_channels)

        # After five pooling stages a 32x32 input is 1x1, so the flattened
        # feature vector is out_channels * 1 * 1 = 512.
        self.classifier = nn.Sequential(
            nn.Flatten(),
            nn.Linear(out_channels * 1 * 1, 4096),
            nn.ReLU(inplace=True),
            nn.Dropout(p=dropout),
            nn.Linear(4096, 4096),
            nn.ReLU(inplace=True),
            nn.Dropout(p=dropout),
            nn.Linear(4096, num_classes),
        )

    def forward(self, x):
        x = self.features(x)
        return self.classifier(x)
