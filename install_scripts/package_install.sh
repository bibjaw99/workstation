#!/usr/bin/env bash
set -euo pipefail

# Variables
repo_url_yay="https://aur.archlinux.org/yay-bin.git"
dir_of_this_script="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dir_github_projects="$HOME/github"
dir_project_yay="$dir_github_projects/$(basename "$repo_url_yay" .git)"

# Function to install yay
install_yay () {
  mkdir -p "$dir_github_projects"

  if [ -d "$dir_project_yay" ]; then
    echo "⚠️ Directory $dir_project_yay already exists, removing it..."
    rm -rf "$dir_project_yay"
  fi

  git clone "$repo_url_yay" "$dir_project_yay"
  cd "$dir_project_yay"
  makepkg -si --noconfirm
}

# Check if yay is installed
if ! command -v yay &>/dev/null; then
  echo "⚠️  yay is not installed!" > /dev/tty
  read -rp "Do you want to install yay now? (y/n): " choice < /dev/tty
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
  file="$dir_of_this_script/package_lists/$list"
  if [[ ! -f "$file" ]]; then
    echo "❌ Missing file: $file"
    exit 1
  fi
done

# store the packages in an array fro the package lists
mapfile -t common_packages < "$dir_of_this_script/package_lists/common_pkg_list.txt"
mapfile -t dev_packages < "$dir_of_this_script/package_lists/dev_pkg_list.txt"
mapfile -t wayland_packages < "$dir_of_this_script/package_lists/wayland_pkg_list.txt"
mapfile -t xorg_packages < "$dir_of_this_script/package_lists/xorg_pkg_list.txt"

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
  echo "Lets choose the display_server !!" > /dev/tty
  read -rp "What is your preference? 1) xorg 2) wayland 3) both : " display_server < /dev/tty
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
