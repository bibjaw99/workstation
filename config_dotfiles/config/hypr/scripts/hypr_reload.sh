#!/usr/bin/env bash
set -euo pipefail

if pgrep -x "waybar" > /dev/null; then
  killall waybar
fi

hyprctl dispatch exec waybar && hyprctl reload
