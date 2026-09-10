#!/usr/bin/env bash

MAKE_DIRECTORIES_SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$MAKE_DIRECTORIES_SCRIPT_PATH/mini_functions.sh"

make_directories() {
  for directory in "$@"; do
    if [[ ! -d  "$directory" ]]; then
      warning "Directory doesn't exist !! Creating $directory directory"
      mkdir -p "$directory"
    else
      info "$directory directory already exists"
    fi
  done
}

# directories to create at the beginning
directories_to_make=(
  "$HOME/.local/share"
  "$HOME/.config"
  "$HOME/.config.backup"
  "$HOME/Pictures/screenshots"
  "$HOME/Pictures/backgrounds"
)

# create necessary directories
run_function make_directories "${directories_to_make[@]}"
