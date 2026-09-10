#!/usr/bin/env bash
ENABLE_SERVICES_SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$ENABLE_SERVICES_SCRIPT_PATH/mini_functions.sh"

# list of services to enable
services_to_enable=(
  bluetooth
  ly
)

enable_service() {
  for service in "$@"; do
    case "$service" in
      bluetooth)
        if systemctl is-enabled --quiet bluetooth.service; then
          info "bluetooth is already enabled..."
        else
          info "Enabling bluetooth..."
          sudo systemctl enable bluetooth.service
        fi
        ;;
      ly)
        # getty@tty2 conflicts with ly
        if systemctl is-enabled --quiet getty@tty2.service; then
          warning "Disabling getty@tty2.service (conflicts with ly)..."
          sudo systemctl disable getty@tty2.service
        else
          info "getty@tty2.service already disabled."
        fi
        # enable ly
        if systemctl is-enabled --quiet ly@tty2.service; then
          info "ly@tty2.service is already enabled..."
        else
          warning "Enabling ly@tty2.service..."
          sudo systemctl enable ly@tty2.service
        fi
        ;;

      *)
        error "Unknown service: $service"
        ;;
    esac
  done
}

# enable systemD services
run_function enable_service "${services_to_enable[@]}"
