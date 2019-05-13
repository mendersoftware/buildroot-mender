#!/bin/sh

set -e
set -x

device_type=$(cat ${TARGET_DIR}/data/mender/device_type | sed 's/[^=]*=//')
artifact_name=$(cat ${TARGET_DIR}/etc/mender/artifact_info | sed 's/[^=]*=//')

if [ -z "${device_type}" ] || [ -z "${artifact_name}" ]; then
    echo "missing files required by Mender (/etc/mender/device_type or /etc/mender/artifact_info)"
    exit 1
fi

${HOST_DIR}/usr/bin/mender-artifact write rootfs-image \
    --update ${BINARIES_DIR}/rootfs.ext4 \
    --output-path ${BINARIES_DIR}/${artifact_name}.mender \
    --artifact-name ${artifact_name} \
    --device-type ${device_type}

GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
rm -rf "${GENIMAGE_TMP}"

genimage \
    --rootpath "${TARGET_DIR}" \
    --tmppath "${GENIMAGE_TMP}" \
    --inputpath "${BINARIES_DIR}" \
    --outputpath "${BINARIES_DIR}" \
    --config "${BR2_EXTERNAL}/board/freescale/imx8mqevk/genimage.cfg"

gzip --force ${BINARIES_DIR}/sdcard.img
