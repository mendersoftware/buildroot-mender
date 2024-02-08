#!/usr/bin/env bash
set -e
CWD=$(pwd)
BOARD_DIR="$(realpath "$(dirname "$0")")"
source "${BOARD_DIR}"/../common/post-image-include
DEVICE_TYPE="buildroot-beaglebone"

# Generate the SDCard image.
generate_image(){
  sed "s/DEVICE_TYPE/${DEVICE_TYPE}.img/g" "${BOARD_DIR}"/genimage.cfg > "${BINARIES_DIR}/genimage.cfg"
  "${CWD}"/support/scripts/genimage.sh -c "${BINARIES_DIR}"/genimage.cfg
}

# Main function.
main(){
  parse_args "${@}"
  make_data_partition "^64bit"
  generate_image
  generate_mender_image
  exit $?

}
main "${@}"
