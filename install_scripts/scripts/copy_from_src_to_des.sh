#!/usr/bin/env bash
COPY_FROM_SRC_TO_DES_SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$COPY_FROM_SRC_TO_DES_SCRIPT_PATH/mini_functions.sh"

dir_dotfiles_src="$COPY_FROM_SRC_TO_DES_SCRIPT_PATH/../../config_dotfiles"
dir_dotfiles_des="$HOME/.local/share/config_dotfiles"

copy_from_src_to_des () {
  local src="$1"
  local dest="$2"

  # validate args
  if [[ -z "$src" || -z "$dest" ]]; then
    error "Usage: copy_dotfiles <source> <destination>"
  fi

  if [[ ! -d "$src" ]]; then
    error "Source directory does not exist: $src"
  fi

  if [[ -d "$dest" ]]; then
  read -r -p $'\e[1;33mFiles/Dir already exists. Overwrite? [y/N]\e[0m ' confirm < /dev/tty

    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
      error "Aborted by user."
    fi

    rm -rf "$dest"
    cp -r "$src" "$dest"
    warning "Copied and overwritten: $dest"
  else
    cp -r "$src" "$dest"
    info "Copied to $dest"
  fi
}

# copy files from src to des
run_function copy_from_src_to_des "$dir_dotfiles_src" "$dir_dotfiles_des"

