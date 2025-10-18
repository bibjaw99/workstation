#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="$HOME/.local/share/config_dotfiles/config/waybar_configs"
TARGET_DIR="$HOME/.config/waybar"

# list available waybar configs with rofi
CONFIG=$(ls -1 "$CONFIG_DIR" | grep -v '^\.' | sort | rofi -dmenu -p "themes")

if [[ -n "$CONFIG" ]]; then
  SELECTED="$CONFIG_DIR/$CONFIG"

  # Check config folder existance
  if [[ ! -d "$SELECTED" ]]; then
    notify-send "Waybar" "Config \"$CONFIG\" not found in $CONFIG_DIR"
    exit 1
  fi

  # notify if already selected
  if [[ -L "$TARGET_DIR" ]] && [[ "$(readlink -f "$TARGET_DIR")" = "$(readlink -f "$SELECTED")" ]]; then
    notify-send "Waybar" "Already using config: $CONFIG"
    exit 0
  fi

  # Make sure parent directories exist
  mkdir -p "$(dirname "$TARGET_DIR")"

  # Remove existing target only if it's not the desired symlink
  # using ln -sfn is to create/replace symlink atomically
  ln -sfn "$SELECTED" "$TARGET_DIR"

  # Restart waybar
  pkill -x waybar 2>/dev/null || true

  # 1 sec waiting time to properly kill the waybar process
  sleep 1

  # handle duplicate waybar after changing themes in sway
  if [[ "$DESKTOP_SESSION" = "sway" ]]; then
    swaymsg reload
  else
    waybar & disown
  fi

else
  notify-send "Waybar" "No configuration selected"
fi
