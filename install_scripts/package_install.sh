#!/usr/bin/env bash
set -euo pipefail

# Variables
dir_of_this_script="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dir_github_projects="$HOME/github"

# Load package lists
for list in common_pkg_list.txt dev_pkg_list.txt wayland_pkg_list.txt ; do
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

# Install package function
install_package () {
  [[ $# -eq 0 ]] && echo "⚠️  No packages to install." && return

  for package in "$@"; do
    if dpkg -s "$package" &>/dev/null; then
      echo "✅ $package already installed."
    else
      echo "📦 Installing $package..."
      sudo apt install "$package"
    fi
  done
}

# Install packages
install_package "${common_packages[@]}"
install_package "${dev_packages[@]}"
install_package "${wayland_packages[@]}"
