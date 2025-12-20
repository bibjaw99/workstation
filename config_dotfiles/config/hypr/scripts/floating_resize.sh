#!/bin/bash

# Check if the active window is floating
floating=$(hyprctl activewindow -j | jq -r '.floating')

if [ "$floating" = "true" ]; then
  hyprctl --batch "
    dispatch resizeactive exact 70% 75%;
    dispatch centerwindow
  "
fi
