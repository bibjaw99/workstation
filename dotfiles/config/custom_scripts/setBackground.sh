#!/bin/bash

# set the background using swaybg

bgFolder="$HOME/Pictures/backgrounds/"
bg=$(cat "$HOME/.cache/wall.txt")
default_bg="$HOME/.config/walls/wall.png"
display_sessions=("wayland" "x11")

for display_session in "${display_sessions[@]}"; do
  case "$display_session" in
    "wayland")
      if [[ -z "$bg" ]]; then
        swaybg -i "$default_bg" -m fill
        exit 1
      else
        swaybg -i "$bgFolder$bg" -m fill
        exit 1
      fi
      ;;

    "x11")
      if [[ -z "$bg" ]]; then
        feh --bg-fill "$default_bg"
        exit 1
      else
        feh --bg-fill "$bgFolder$bg"
        exit 1
      fi
      ;;
  esac
done
