#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mapfile -t FLATPAK_PACKAGES < "$SCRIPT_DIR/flatpak_pkg_list.txt"

install_flatpak_package () {
  [[ $# -eq 0 ]] && echo "⚠️  No packages to install." && return

  for package in "$@"; do
    if flatpak list --app | grep -q "$package"; then
      echo "✅ $package already installed."
    else
      echo "📦 Installing $package..."
      flatpak install -y "$package"
    fi
  done
}

install_flatpak_package "${FLATPAK_PACKAGES[@]}"
