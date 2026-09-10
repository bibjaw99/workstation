#!/usr/bin/env bash

launch_tui_app() {
  local term="footclient"
  # get the full command
  local cmd="$*"
  # get the base command
  local base_cmd="${1}"

  # validate if base command is already running
  if pgrep -x "$base_cmd" >/dev/null; then
    notify-send -u low "$base_cmd is already running"
  else
    nohup "$term" -e $cmd >/dev/null 2>&1 &
  fi
}

launch_tui_app "$@"
