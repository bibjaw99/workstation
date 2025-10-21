#!/usr/bin/env bash
set -euo pipefail

if pidof cmus ; then
  notify-send -u low "CMUS 󰋌 is already running"
  exit 1
else
  $TERMINAL -e cmus & disown
fi
