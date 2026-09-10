#!/usr/bin/env bash

# saved networks
saved_network=$(nmcli -t -f NAME connection show | sed '/^$/d' | sort -u | rofi -dmenu -p "Remove WiFi")

[ -z "$saved_network" ] && exit 0

# confirm deletion
confirmation=$(printf '%s\n' "Yes" "No" | rofi -dmenu -p "Delete '$saved_network'?")

[ "$confirmation" = "Yes" ] || exit 0

# remove saved network with delete command
nmcli connection delete "$saved_network" && notify-send "WiFi Deleted" "$saved_network is removed"
