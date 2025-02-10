#!/usr/bin/env bash
set -e
BOARD_DIR="$(realpath "$(dirname "$0")")"
source "${BOARD_DIR}"/../../common/post-build-include

add_tty() {
  mkdir -p "${TARGET_DIR}/etc/systemd/system/getty.target.wants"
  ln -sf /lib/systemd/system/getty@.service \
    "${TARGET_DIR}/etc/systemd/system/getty.target.wants/getty@tty1.service"
}

main(){
  parse_args "${@}"
  add_tty
  setup_mender
}

main "${@}"
