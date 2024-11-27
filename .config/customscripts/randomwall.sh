#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/backgrounds"  # Change this to your wallpaper directory

# Select a random image from the directory
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.jpeg \) | shuf -n 1)

# Set the wallpaper using swaybg
swaybg -i "$RANDOM_WALLPAPER" -m fill
