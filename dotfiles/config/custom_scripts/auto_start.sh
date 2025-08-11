#!/usr/bin/env bash

run_once() {
  if ! pgrep -f "$1" > /dev/null; then
    "$@" &
  fi
}

run_once "$HOME/.config/custom_scripts/setBackground.sh"
run_once "$HOME/.config/custom_scripts/tempWarning.sh"
run_once "$HOME/.config/custom_scripts/batteryWarning.sh"
