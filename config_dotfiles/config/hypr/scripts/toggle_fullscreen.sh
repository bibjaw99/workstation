#!/bin/bash

current_fullscreenstate=$(hyprctl activewindow -j | jq '.fullscreen')

toggle_fullscreen() {
  # Toggle between 0 and 3
  if [[ "$current_fullscreenstate" -eq 0 ]]; then
    hyprctl dispatch fullscreenstate 3 toggle
  elif [[ "$current_fullscreenstate" -eq 3 ]]; then
    hyprctl dispatch fullscreenstate 0 toggle
  else
    hyprctl dispatch fullscreenstate 3 toggle
  fi
}

toggle_maximize() {
  # Toggle between 0 and 1
  if [[ "$current_fullscreenstate" -eq 0 ]]; then
    hyprctl dispatch fullscreenstate 1 toggle
  elif [[ "$current_fullscreenstate" -eq 1 ]]; then
    hyprctl dispatch fullscreenstate 0 toggle
  else
    hyprctl dispatch fullscreenstate 1 toggle
  fi
}

case "$1" in
  fullscreen)
    toggle_fullscreen
    ;;
  maximize)
    toggle_maximize
    ;;
  *)
    echo "Usage: $0 [fullscreen|maximize]"
    exit 1
    ;;
esac
