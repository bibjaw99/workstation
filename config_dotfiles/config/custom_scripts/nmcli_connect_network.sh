#!/usr/bin/env bash

# list of networks
selected_network=$(nmcli -t -f SSID dev wifi list | sed '/^$/d' | sort -u | fuzzel --dmenu --prompt="WiFi: ")

[ -z "$selected_network" ] && exit 0

# connect to already saved networks
if nmcli -t -f NAME connection show | grep -Fxq "$selected_network"; then
  if nmcli connection up "$selected_network"; then
    notify-send "WiFi Connected" "Connected to $selected_network"
    exit 0
  else
    notify-send -u critical "WiFi Connection Failed" "Could not connect to $selected_network"
    exit 1
  fi
fi

# 3 times pass check
for attempt in 1 2 3; do
  PASSWORD=$(printf '' | fuzzel --dmenu --password='*' --prompt-only="$selected_network Pass ($attempt/3): " --width=60 )

  [ -z "$PASSWORD" ] && exit 0

  if nmcli device wifi connect "$selected_network" password "$PASSWORD"; then
    notify-send "WiFi Connected" "Connected to $selected_network"
    exit 0
  fi

  sleep 0.5
done

# connection failed notification
notify-send -u critical "WiFi Connection Failed" "Failed to connect to $selected_network"
