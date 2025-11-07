#!/usr/bin/env bash
set -euo pipefail

launch_cmus_in_tmux() {
  if pidof cmus >/dev/null; then
    notify-send -u low "CMUS 󰋌 is already running"
  else
    "$TERMINAL" -e cmus
  fi
}

launch_cmus_in_tmux
