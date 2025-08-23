#!/bin/bash

# Read values from /proc/meminfo
while read -r key value _; do
  case "$key" in
    MemTotal:)       total=$value ;;
    MemFree:)        free=$value ;;
    "Active(file):")     active_file=$value ;;
    "Inactive(file):")   inactive_file=$value ;;
    SReclaimable:)   sreclaimable=$value ;;
  esac
done < /proc/meminfo

# htop-style used memory (kB)
used=$(( total - (free + active_file + inactive_file + sreclaimable) ))

# Convert to MB/GB
if (( used < 1048576 )); then
  mem_str="$(( used / 1024 ))MiB"
else
  mem_str="$(awk -v val=$used 'BEGIN {printf "%.1fGiB", val/1048576}')"
fi

# Output JSON for Waybar
echo "{\"text\": \"$mem_str\"}"
