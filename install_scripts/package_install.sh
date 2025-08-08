#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v yay &>/dev/null; then
  echo "❌ yay is not installed. Please install yay first."
  exit 1
fi

mapfile -t common_packages < "$SCRIPT_DIR/common_pkg_list.txt"
mapfile -t dev_packages < "$SCRIPT_DIR/dev_pkg_list.txt"
mapfile -t wayland_packages < "$SCRIPT_DIR/wayland_pkg_list.txt"
mapfile -t xorg_packages < "$SCRIPT_DIR/xorg_pkg_list.txt"

install_package () {
  [[ $# -eq 0 ]] && echo "⚠️  No packages to install." && return

  for package in "$@"; do
    if pacman -Qq "$package" &>/dev/null; then
      echo "✅ $package already installed."
    else
      echo "📦 Installing $package..."
      yay -S --noconfirm "$package"
    fi
  done
}

# Install common packages
install_package "${common_packages[@]}"
install_package "${dev_packages[@]}"

# Display server choice
while true; do
  echo -n "What is your preference? 1) xorg 2) wayland 3) both : " > /dev/tty
  read -r display_server < /dev/tty

  case "$display_server" in
    1)
      install_package "${xorg_packages[@]}"
      break
      ;;
    2)
      install_package "${wayland_packages[@]}"
      break
      ;;
    3)
      install_package "${wayland_packages[@]}"
      install_package "${xorg_packages[@]}"
      break
      ;;
    *)
      echo "Invalid input. Please choose 1, 2, or 3."
      ;;
  esac
done
