#!/bin/bash

folder="$HOME/Pictures/backgrounds/"
mapfile -t wallpapers < <(find "$folder" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" \) -printf "%f\t%p\n")
selected=$(printf '%s\n' "${wallpapers[@]}" | cut -f1 | rofi -dmenu -i -p "Walls")
if [ -n "$selected" ]; then
  full_path=$(printf '%s\n' "${wallpapers[@]}" | grep -F "$selected" | cut -f2 -d$'\t')
  echo "$(basename "$full_path")" > "$HOME/.cache/wall.txt"
    # swaybg
    if command -v swaybg >/dev/null 2>&1; then
      pkill swaybg 2>/dev/null
      swaybg -i "$full_path" -m fill &
    else
      echo "Warning: swaybg is not installed." >&2
    fi

    # feh
    if command -v feh >/dev/null 2>&1; then
      feh --bg-fill "$full_path"
    else
      echo "Warning: feh is not installed." >&2
    fi
fi
