#!/usr/bin/env bash
SYMLINK_CONFIGS_SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SYMLINK_CONFIGS_SCRIPT_PATH/mini_functions.sh"

backup_directory="$HOME/.config.backup/$(date +"%Y%m%d_%H-%M-%S")"
mkdir -p "$backup_directory"

# details of configs needed to be symlinked
config_db="$SYMLINK_CONFIGS_SCRIPT_PATH/../db/config_dotfiles.db.json"


symlink_configs() {
  local src="$1"
  local des="$2"
  local name="$3"
  local backup_dir="$4"

  # expand paths
  local expanded_src
  local expanded_des
  expanded_src="$(eval echo "$src")"
  expanded_des="$(eval echo "$des")"

  # backup pre-existing config (if not a symlink)
  if [[ -e "$expanded_des" && ! -L "$expanded_des" ]]; then
    info "Backing up the config to $backup_dir"
    mv "$expanded_des" "$backup_dir"

  # remove existing symlink
  elif [[ -L "$expanded_des" ]]; then
    warning "Removing symlink: $des"
    rm "$expanded_des"
  fi

  # create symlink
  info "Linking $src → $des"
  ln -sfn "$expanded_src" "$expanded_des"
  success "Done Linking ${name:-config}"
}

# back up config and symlink with dotfiles
symlink_process() {
  while IFS= read -r data; do
    name=$(jq -r ".name" <<< "$data")
    config_src=$(jq -r ".config_src" <<< "$data")
    config_des=$(jq -r ".config_des" <<< "$data")

    run_function symlink_configs "$config_src" "$config_des" "$name" "$backup_directory"
  done < <(jq -c ".[]" "$config_db")

  # remove the backup directory if it's empty
  if [[ -z "$(ls -A "$(eval echo "$backup_directory")")" ]]; then
    info "Nothing to backup, no need for the backup directory"
    rm -rf "$backup_directory"
  fi
}

run_function symlink_process
