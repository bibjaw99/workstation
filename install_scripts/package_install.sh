#!/usr/bin/env bash
set -euo pipefail

# Variables
YAY_URL="https://aur.archlinux.org/yay-bin.git"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GITHUB_PROJECT_DIR="$HOME/github"
YAY_DIR="$GITHUB_PROJECT_DIR/$(basename "$YAY_URL" .git)"

# Function to install yay
install_yay () {
  mkdir -p "$GITHUB_PROJECT_DIR"

  if [ -d "$YAY_DIR" ]; then
    echo "⚠️ Directory $YAY_DIR already exists, removing it..."
    rm -rf "$YAY_DIR"
  fi

  git clone "$YAY_URL" "$YAY_DIR"
  cd "$YAY_DIR"
  makepkg -si --noconfirm
}

# Check if yay is installed
if ! command -v yay &>/dev/null; then
  echo "⚠️  yay is not installed!"
  read -rp "Do you want to install yay now? (y/n): " choice
  case "$choice" in
    y|Y) 
      echo "📥 Installing yay..."
      install_yay
      ;;
    *)
      echo "❌ yay installation skipped. Please install yay before proceeding."
      exit 1
      ;;
  esac
fi

# Load package lists
for list in common_pkg_list.txt dev_pkg_list.txt wayland_pkg_list.txt xorg_pkg_list.txt; do
  file="$SCRIPT_DIR/$list"
  if [[ ! -f "$file" ]]; then
    echo "❌ Missing file: $file"
    exit 1
  fi
done

mapfile -t common_packages < "$SCRIPT_DIR/common_pkg_list.txt"
mapfile -t dev_packages < "$SCRIPT_DIR/dev_pkg_list.txt"
mapfile -t wayland_packages < "$SCRIPT_DIR/wayland_pkg_list.txt"
mapfile -t xorg_packages < "$SCRIPT_DIR/xorg_pkg_list.txt"

# Install package function
install_package () {
  [[ $# -eq 0 ]] && echo "⚠️  No packages to install." && return

  for package in "$@"; do
    if yay -Qq "$package" &>/dev/null; then
      echo "✅ $package already installed."
    else
      echo "📦 Installing $package..."
      yay -S --noconfirm "$package"
    fi
  done
}

# Install common + dev packages
install_package "${common_packages[@]}"
install_package "${dev_packages[@]}"

# Ask for display server preference
while true; do
  read -rp "What is your preference? 1) xorg 2) wayland 3) both : " display_server
  case "$display_server" in
    1) install_package "${xorg_packages[@]}"; break ;;
    2) install_package "${wayland_packages[@]}"; break ;;
    3) 
      install_package "${wayland_packages[@]}"
      install_package "${xorg_packages[@]}"
      break
      ;;
    *) echo "❌ Invalid input. Please choose 1, 2, or 3." ;;
  esac
done
