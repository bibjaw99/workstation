#!/usr/bin/env bash

TEMP=$(sensors | grep -m 1 'Package id 0' | awk '{print $4}' | tr -d '+°C')

if [[ -z "$TEMP" ]]; then
  TEMP=$(sensors | grep -m 1 'edge' | awk '{print $2}' | tr -d '+°C')
fi

if [[ -z "$TEMP" ]]; then
  CLASS="unknown"
  FORMAT="<span color='#555555'>[󰴈]</span> N/A °C"
  printf '{"text":"%s","class":"%s"}\n' "$FORMAT" "$CLASS"
  exit 0
fi

TEMP_INT=$(printf "%.0f" "$TEMP")

if (( TEMP_INT >= 75 )); then
  CLASS="critical"
  FORMAT="<span color='#cc241d'>[]</span> ${TEMP_INT}°C"
else
  CLASS="normal"
  FORMAT="<span color='#d8a657'>[󰴈]</span> ${TEMP_INT}°C"
fi

printf '{"text":"%s","class":"%s"}\n' "$FORMAT" "$CLASS"
