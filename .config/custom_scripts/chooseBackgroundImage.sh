#!/bin/bash

# script for choosing the backgrounds image using rofi

folder="$HOME/Pictures/backgrounds/"
files=$(find "$folder" -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.jpeg -o -iname \*.gif \) | xargs -n 1 basename)
selected=$(echo "$files" | rofi -dmenu -i -p "Select Image:")

if [ -n "$selected" ]; then
  full_path=$(find "$folder" -type f -name "$selected")
  if pgrep -x swaybg > /dev/null; then
    killall swaybg
  fi
  echo "$(basename "$full_path")" > "$HOME/.cache/wall.txt"
  swaybg -i "$full_path" -m fill
fi
