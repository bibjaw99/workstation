#!/usr/bin/env bash

INSTALL_WITH_FLATPAK_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$INSTALL_WITH_FLATPAK_SCRIPT_DIR/mini_functions.sh"

# flatpak apps list as array
mapfile -t flatpak_packages < "$INSTALL_WITH_FLATPAK_SCRIPT_DIR/../package_lists/flatpak_pkg_list.txt"
exit_status="$?"

install_flatpak_package () {
  # install flatpak if not installed
  if ! pacman -Qq "flatpak" &>/dev/null;then
    sudo pacman -S --noconfirm "flatpak"
  fi

  if [[ "$exit_status" == 0 ]];then
    success "flatpak is installed !!!"
    printf "\n"
    # install flatpak packages
    for package in "$@"; do
      if flatpak list --app | grep -q "$package"; then
        info "$package already installed."
      else
        echo "📦 Installing $package..."
        flatpak install -y "$package"
      fi
    done
  fi
}

install_flatpak_package "${flatpak_packages[@]}"
