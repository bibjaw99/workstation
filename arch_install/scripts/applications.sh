#!/bin/bash
# GUI Applicationss

packages=(
zen-browser-bin
libreoffice-fresh
)

for package in "${packages[@]}"; do
  installed=$(yay -Qi "$package" 2>/dev/null | awk -F ' *: ' '$1 == "Name" { print $2 }')
  if [[ -z "$installed" ]]; then
    yay -Syy "$package"
  else
    echo "$package is already installed"
  fi
done
