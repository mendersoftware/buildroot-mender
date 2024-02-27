#!/usr/bin/env bash
set -e
BOARD_DIR="$(realpath "$(dirname "$0")")"
source "${BOARD_DIR}"/../common/post-image-include
IMAGE_DIR="$(realpath "${BOARD_DIR}"/../../images)"
DEVICE_TYPE="buildroot-x86_64"


generate_image() {
  UUID_ROOT=$(dumpe2fs "${BINARIES_DIR}/rootfs.ext2" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p' || true)
  UUID_DATA=$(dumpe2fs "${BINARIES_DIR}/data-part.ext4" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p' || true)
  sed "s/UUID_ROOT_TMP/${UUID_ROOT}/g" "${BOARD_DIR}"/genimage.cfg > "${BINARIES_DIR}/genimage.cfg"
  sed "s/DISK_IMG/${DEVICE_TYPE}.img/g" -i "${BINARIES_DIR}/genimage.cfg"
  sed "s/UUID_ROOT_TMP/${UUID_ROOT}/g" -i "${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg"
  sed "s/UUID_DATA_TMP/${UUID_DATA}/g" -i "${BINARIES_DIR}/genimage.cfg"
  sh support/scripts/genimage.sh -c "${BINARIES_DIR}"/genimage.cfg
}


copy_image() {
  mkdir -p "${IMAGE_DIR}"
  cp -rf "${BINARIES_DIR}"/x64.img "${IMAGE_DIR}"/x64.img
}


main(){
  parse_args "${@}"
  make_data_partition "64bit"
  generate_image
  generate_mender_image
  # copy_image
  exit $?
}
main "${@}"
