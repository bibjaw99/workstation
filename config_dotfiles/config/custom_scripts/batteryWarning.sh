#!/bin/bash

check_battery() {
  batt=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/ {print $2}' | tr -d '%')
  if [[ "$batt" -le 20 ]]; then
    notify-send -u critical "⚡ Need Juice" "Battery is at ${batt}%"
  elif [[ "$batt" -le 30 ]]; then
    notify-send -u low "⚡ Low Battery" "Battery is at ${batt}%"
  fi
}

while true; do
  state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/state/ {print $2}')
  if [[ "$state" == "discharging" ]]; then
    check_battery
  fi
  sleep 300
done
