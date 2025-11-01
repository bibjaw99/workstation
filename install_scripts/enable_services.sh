#!/usr/bin/env bash
set -euo pipefail

services_to_enable=(
  bluetooth
  sddm
)

enable_service() {
  for service in "$@"; do
    if systemctl is-enabled --quiet "$service"; then
      echo "$service is already running....."
    else
      echo "enabling $service..."
      sudo systemctl enable "$service"
    fi
  done
}

enable_service "${services_to_enable[@]}"
echo "All services processed!"
