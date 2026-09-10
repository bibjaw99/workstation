#!/usr/bin/env bash

INSTALL_SH_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$INSTALL_SH_SCRIPT_DIR/scripts/mini_functions.sh"
source "$INSTALL_SH_SCRIPT_DIR/scripts/make_directories.sh"
source "$INSTALL_SH_SCRIPT_DIR/scripts/install_with_pacman.sh"
source "$INSTALL_SH_SCRIPT_DIR/scripts/copy_from_src_to_des.sh"
source "$INSTALL_SH_SCRIPT_DIR/scripts/symlink_configs.sh"
source "$INSTALL_SH_SCRIPT_DIR/scripts/install_aur_helper.sh"
source "$INSTALL_SH_SCRIPT_DIR/scripts/enable_services.sh"

# exit code
exit_status="$?"

if [[ "$exit_status" == 0 ]];then
  success "Everything worked well !! Enjoy the setup."
else
  error "Things went wrong..."
fi
