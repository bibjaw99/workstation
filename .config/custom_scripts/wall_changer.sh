#!/usr/bin/env bash

WP_DIR="${HOME}/Pictures/backgrounds"
MODE="fill"

# Step 1: Gather full paths
mapfile -t full_paths < <(find "$WP_DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) | sort)

# Step 2: Create a parallel array with only filenames
filenames=()
for f in "${full_paths[@]}"; do
  filenames+=("${f##*/}")
done

# Step 3: Prompt via rofi, showing filenames
choice=$(printf '%s\n' "${filenames[@]}" | rofi -dmenu -i -p "Walls:")

# Step 4: If a choice was made, find its index in filenames
if [[ -n "$choice" ]]; then
  # Using '==' to match exact filename
  for i in "${!filenames[@]}"; do
    if [[ "${filenames[$i]}" == "$choice" ]]; then
      selected="${full_paths[$i]}"
      break
    fi
  done

  # Step 5: Set the wallpaper with swaybg
  if [[ -n "$selected" ]]; then
    pkill swaybg
    swaybg -o "*" -i "$selected" -m "$MODE" &
  fi
fi
