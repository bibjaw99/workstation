#!/bin/bash

# for my amd setup

# yay -Syy \
# xf86-video-amdgpu \
# xf86-video-ati \
# amd-ucode \
# amdvlk \
# vulkan-radeon

# for my intel laptop

packages=(
# xorg
intel-media-driver
vulkan-intel
intel-gmmlib
)

for package in "${packages[@]}"; do
  installed=$(yay -Qi "$package" 2>/dev/null | awk -F ' *: ' '$1 == "Name" { print $2 }')
  if [[ -z "$installed" ]]; then
    yay -S --noconfirm "$package"
  else
    echo "$package is already installed"
  fi
done
