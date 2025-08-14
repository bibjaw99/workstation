#!/bin/bash

# notify high temperature

# Threshold in Celsius
THRESHOLD=80

check_temp() {
  # Get CPU temp (modify grep/awk part if needed)
  TEMP=$(sensors | grep -m 1 'Package id 0' | awk '{print $4}' | tr -d '+°C')

  # If the temperature is not empty and above threshold
  if [[ -n "$TEMP" && "${TEMP%.*}" -ge "$THRESHOLD" ]]; then
    notify-send -u critical "🔥 High Temperature" "CPU Temp is ${TEMP}°C"
  fi
}

# Infinite loop
while true; do
  check_temp
  sleep 40
done
