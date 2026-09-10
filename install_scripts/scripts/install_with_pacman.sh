#!/usr/bin/env bash
INSTALL_WITH_PACMAN_SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$INSTALL_WITH_PACMAN_SCRIPT_PATH/mini_functions.sh"

install_with_pacman() {
  for pkg in "$@"; do
    # check existance of a package
    if pacman -Qq "$pkg" &>/dev/null; then
      info "$pkg already installed"
      # isntall if package doesn't exists
    else
      sudo pacman -S --noconfirm "$pkg"
    fi
  done
}

# array of packages
mapfile -t common_packages < "$INSTALL_WITH_PACMAN_SCRIPT_PATH/../package_lists/common_pkg_list.txt"
mapfile -t cmus_packages < "$INSTALL_WITH_PACMAN_SCRIPT_PATH/../package_lists/cmus_pkg_list.txt"
mapfile -t dev_packages < "$INSTALL_WITH_PACMAN_SCRIPT_PATH/../package_lists/dev_pkg_list.txt"
mapfile -t wayland_packages < "$INSTALL_WITH_PACMAN_SCRIPT_PATH/../package_lists/wayland_pkg_list.txt"
mapfile -t gui_packages < "$INSTALL_WITH_PACMAN_SCRIPT_PATH/../package_lists/gui_pkg_list.txt"

# install pacman packages
run_function install_with_pacman "${common_packages[@]}"
run_function install_with_pacman "${cmus_packages[@]}"
run_function install_with_pacman "${dev_packages[@]}"
run_function install_with_pacman "${wayland_packages[@]}"
run_function install_with_pacman "${gui_packages[@]}"
