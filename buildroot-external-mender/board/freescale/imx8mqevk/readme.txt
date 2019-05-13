*************************************************
Mender integration on Freescale i.MX8MQ EVK board
*************************************************

This file documents the Buildroot integration of Mender for the Freescale i.MX8MQ
EVK board.

Build
=====

First, generate the configuration file,

  ./buildroot-external-mender/board/freescale/imx8mqevk/gen-defconfig.sh

Configure Buildroot for the i.MX8MQ EVK board:

  make mender_freescale_imx8mqevk_defconfig

Build all components:

  make

Using the build output
======================

You will find in output/images/ the following files:
  - release-1.mender
  - sdcard.img.gz

The disk image (with .sdimg suffix) is used to provision the device storage for
devices without Mender running already.

On the other hand, if you already have Mender running on your device and want
to deploy a rootfs update using this build, you should use the Mender
Artifact[1] files, which have `.mender` suffix. You can either deploy this
Artifact in managed mode with the Mender server as described in "Deploy to
physical devices"[2] or by using the Mender client only in
Standalone deployments[3].

Create a bootable SD card
=========================

To determine the device associated to the SD card have a look in the
/proc/partitions file:

  cat /proc/partitions

Buildroot prepares a bootable "sdcard.img.gz" image in the output/images/
directory, ready to be dumped on a SD card. Launch the following
command as root:

  zcat output/images/sdcard.img.gz | sudo dd of=/dev/<your-sd-device>

*** WARNING! This will destroy all the card content. Use with care! ***

Boot the i.MX8MQ EVK board
==========================

To boot your newly created system:
- insert the SD card in the SD slot of the board;
- Configure the switches as follows:
SW801:  ON  ON  OFF OFF
SW802:  ON  OFF
- put a micro USB cable into the Debug USB Port and connect using a terminal
  emulator at 115200 bps, 8n1;
- power on the board.

[1]. https://docs.mender.io/architecture/mender-artifacts
[2]. https://docs.mender.io/getting-started/deploy-to-physical-devices
[3]. https://docs.mender.io/architecture/standalone-deployments
