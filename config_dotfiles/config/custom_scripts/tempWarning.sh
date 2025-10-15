#!/bin/bash

THRESHOLD=80

check_temp() {
  TEMP=$(sensors | grep -m 1 'Package id 0' | awk '{print $4}' | tr -d '+°C')

  if [[ -n "$TEMP" && "${TEMP%.*}" -ge "$THRESHOLD" ]]; then
    notify-send -u critical "🔥 High Temperature" "CPU Temp is ${TEMP}°C"
  fi
}

# Infinite loop
while true; do
  check_temp
  sleep 40
done
