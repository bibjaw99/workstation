#!/usr/bin/env bash
set -euo pipefail

# Variables
dir_of_this_script="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dir_github_projects="$HOME/github"

# store the packages in an array for the package lists
mapfile -t common_packages < "$dir_of_this_script/package_lists/common_pkg_list.txt"
mapfile -t dev_packages < "$dir_of_this_script/package_lists/dev_pkg_list.txt"
mapfile -t wayland_packages < "$dir_of_this_script/package_lists/wayland_pkg_list.txt"
mapfile -t gui_packages < "$dir_of_this_script/package_lists/gui_pkg_list.txt"

# Install package function
install_package () {
  [[ $# -eq 0 ]] && echo "⚠️  No packages to install." && return

  for package in "$@"; do
    if pacman -Qq "$package" &>/dev/null; then
      echo "✅ $package already installed."
    else
      echo "📦 Installing $package..."
      sudo pacman -S --noconfirm "$package"
    fi
  done
}

# Install packages
install_package "${common_packages[@]}"
install_package "${dev_packages[@]}"
install_package "${wayland_packages[@]}"
install_package "${gui_packages[@]}"
