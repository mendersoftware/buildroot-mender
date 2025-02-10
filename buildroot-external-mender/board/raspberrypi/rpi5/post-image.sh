#!/usr/bin/env bash
set -eu

BOARD_DIR="$(realpath "$(dirname "$0")")"
CONFIG_TXT="${BOARD_DIR}/config.txt"
GENIMAGE_CFG="${BINARIES_DIR}/genimage.cfg"
RPI_FIRMWARE_OVERLAY_FILES_DIR="${BINARIES_DIR}/rpi-firmware/overlays"
IMAGE_DIR="$(realpath "${BOARD_DIR}"/../../../images)"
DEVICE_TYPE="buildroot-rpi5"
source "${BOARD_DIR}"/../../common/post-image-include


# Check config.txt for dtoverlay= lines and do the following:
# - Ensure that a matching .dtbo file exists in rpi-firmware/overlays
# - Set #OVERLAY_DIR# to "overlays" if dtoverlay= lines are in config.txt
# - Remove the #OVERLAY_DIR# line completely if no dtoverlay= lines are in config.txt
#
# Essentially, this is a sanity check to make sure the dtoverlay lines will,
# at the very least, load a dtbo file.
parse_rpi_firmware_overlay_files() {
  overlay_files="False"
  while IFS= read -r line; do
    if [ "${line:0:1}" == "#" ]; then
      continue
    fi
    line=$(echo "${line}" |awk -F'=' '{print $2}' |awk -F',' '{print $1}')
    overlay_file="${RPI_FIRMWARE_OVERLAY_FILES_DIR}/${line}.dtbo"
    if [ ! -e "${overlay_file}" ]; then
      echo "Error: dtoverlay=${line} in ${BOARD_DIR}/config.txt but ${overlay_file} does not exist!"
      exit 1
    fi
    overlay_files="True"
  done < <(grep "dtoverlay" "${CONFIG_TXT}")

  if [ "${overlay_files}" == "True" ]; then
    sed "s%#OVERLAY_DIR#%rpi-firmware/overlays%" "${BOARD_DIR}/genimage.cfg.in" > "${GENIMAGE_CFG}"
  else
    sed '/"#OVERLAY_DIR#",/d' "${BOARD_DIR}/genimage.cfg.in" > "${GENIMAGE_CFG}"
  fi
}

generate_image() {
  parse_rpi_firmware_overlay_files
  cp "${BOARD_DIR}"/config.txt "${BINARIES_DIR}"/config.txt
  bash support/scripts/genimage.sh -c "${BINARIES_DIR}"/genimage.cfg
}


copy_image() {
  mkdir -p "${IMAGE_DIR}"
  cp -rf "${BINARIES_DIR}"/rpi5.img "${IMAGE_DIR}"/rpi5.img
}


main(){
  parse_args "${@}"
  make_data_partition "64bit"
  generate_image
  copy_image
  exit $?
}

main "${@}"
