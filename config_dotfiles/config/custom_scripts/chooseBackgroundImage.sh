#!/usr/bin/env bash

get_wall_name() {
  local backgrounds_directory="$HOME/Pictures/backgrounds"
  local images=()

  while IFS= read -r file; do
      name="${file##*/}"
      images+=("$name")
  done < <(find "$backgrounds_directory" -maxdepth 1 -type f \( \
      -iname "*.jpg" -o \
      -iname "*.jpeg" -o \
      -iname "*.png" -o \
      -iname "*.gif" -o \
      -iname "*.bmp" -o \
      -iname "*.webp" \
  \))
  selected_wall="$(printf '%s\n' "${images[@]}" | sort | fuzzel --dmenu --prompt="Walls: ")"
  [[ -z "$selected_wall" ]] && exit 1
  echo "$selected_wall" > "$HOME/.cache/wall.txt"
  pkill swaybg
  swaybg -i "$backgrounds_directory/$selected_wall" -m fill >/dev/null 2>&1 &
}

get_wall_name
