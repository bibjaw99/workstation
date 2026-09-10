#!/usr/bin/env bash

# get opened containers / windows
sway_windows=$(
  swaymsg -t get_tree | jq -r 'recurse(.nodes[]?, .floating_nodes[]?) 
  | select((.type == "con" or .type == "floating_con") and .name != null)
  | [
      .id,
      (.app_id // .window_properties.class // .window_properties.instance // "unknown"),
      .name,
      (if .type == "floating_con" then "FLOATING" else "TILED" end)
    ]
  | @tsv' | fuzzel --dmenu --prompt="Window picker: " --width=100
)

# no input
if [ -z "$sway_windows" ]; then
    exit 0
fi

# container_id
window_id=$(printf '%s\n' "$sway_windows" | cut -f1)

# assure getting the id
if ! [[ "$window_id" =~ ^[0-9]+$ ]]; then
    exit 1
fi

# Focus selected window
swaymsg "[con_id=$window_id] focus"
