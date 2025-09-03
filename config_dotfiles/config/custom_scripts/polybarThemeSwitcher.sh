#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="$HOME/.local/share/dotfiles/config/polybar_configs/"
TARGET_DIR="$HOME/.config/polybar"

# show choices with rofi
CONFIG=$(ls -1 "$CONFIG_DIR" | grep -v '^\.' | sort | rofi -dmenu -p "themes")

# If user made a selection
if [[ -n "$CONFIG" ]]; then
  SELECTED="$CONFIG_DIR/$CONFIG"

  # Check that the selected folder actually exists
  if [[ ! -d "$SELECTED" ]]; then
    notify-send "Polybar" "Config \"$CONFIG\" not found in $CONFIG_DIR"
    exit 1
  fi

  # If target already exists and is the correct symlink, do nothing
  if [[ -L "$TARGET_DIR" ]] && [[ "$(readlink -f "$TARGET_DIR")" = "$(readlink -f "$SELECTED")" ]]; then
    notify-send "Polybar" "Already using config: $CONFIG"
    exit 0
  fi

  # Make sure parent exists
  mkdir -p "$(dirname "$TARGET_DIR")"

  # Remove existing target only if it's not the desired symlink (ln -sfn will replace safely)
  # Use ln -sfn to create/replace symlink atomically
  ln -sfn "$SELECTED" "$TARGET_DIR"

  # Restart polybar: try to kill existing instances, then start a new one
  pkill -x polybar 2>/dev/null || true
  # small delay to let previous instances die cleanly
  sleep 0.2
  # start polybar in background and detach from terminal
  polybar & disown
else
  notify-send "polybar" "No configuration selected"
fi
