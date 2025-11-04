#!/usr/bin/env bash
set -euo pipefail

TERMINAL="ghostty"
SESSION_NAME="music"

launch_cmus_in_tmux() {
  if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    if pidof cmus >/dev/null; then
      notify-send -u low "CMUS 󰋌 is already running"
      return 0
    fi
    "$TERMINAL" -e tmux attach -t "$SESSION_NAME" & disown
  else
    "$TERMINAL" -e tmux new-session -s "$SESSION_NAME" "bash -l -c cmus" & disown
  fi
}

launch_cmus_in_tmux
