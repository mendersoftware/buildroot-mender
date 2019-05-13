#!/bin/sh

set -e

SOURCE_DEFCONFIG="freescale_imx8mqevk_defconfig"
TARGET_DEFCONFIG="mender_freescale_imx8mqevk_defconfig"

if [ ! -d buildroot ]; then
    echo "Sorry, you must execute this script from the top directory"
    exit 1
fi

cp buildroot/configs/${SOURCE_DEFCONFIG} buildroot-external-mender/configs/${TARGET_DEFCONFIG}

# Remove confliction configs
sed -i '/^BR2_ROOTFS_POST_IMAGE_SCRIPT/ d' buildroot-external-mender/configs/${TARGET_DEFCONFIG}

cat buildroot-external-mender/board/common/mender-common.cfg \
    buildroot-external-mender/board/freescale/imx8mqevk/defconfig.cfg \
    >> buildroot-external-mender/configs/${TARGET_DEFCONFIG}
