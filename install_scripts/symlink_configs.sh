#!/usr/bin/env bash
set -euo pipefail

dir_of_this_script="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dir_dotfiles="$HOME/.local/share/config_dotfiles/config"
dir_config="$HOME/.config"
dir_backup="$HOME/.config.backup/$(date +"%Y%d%m_%H-%M-%S")"

# make sure config and backup dir exists
mkdir -p "$dir_config"
mkdir -p "$dir_backup"

# store the config directory names in an array
mapfile -t dir_config_directories < "$dir_of_this_script/config_lists/config_dirs.txt"

# default configs
default_dotfile_waybar="$HOME/.local/share/config_dotfiles/config/waybar_configs/waybar_block_alt/"

for directory in "${dir_config_directories[@]}"; do
  path_config="$dir_config/$directory"
  # Override config path for special cases
  case "$directory" in
    waybar)
      path_dotfile="$default_dotfile_waybar"
      ;;
    *)
      path_dotfile="$dir_dotfiles/$directory"
      ;;
  esac

  echo "▶ Processing $directory..."

  # Check if config source exists
  if [[ ! -d "$path_dotfile" ]]; then
    echo "⚠️  Skipping: Config not found at $path_dotfile"
    continue
  fi

  # If the target is a symlink, remove it
  if [[ -L "$path_config" ]]; then
    echo "🔗 Removing symlink: $path_config"
    rm "$path_config"

  # If it's a real directory, back it up
  elif [[ -d "$path_config" ]] && [[ ! -L "$path_config" ]]; then
    echo "📦 Backing up real directory to: $dir_backup/$directory"
    mv "$path_config" "$dir_backup/$directory"

  else
    echo "ℹ️  No existing config at $path_config — no need to backup"
  fi

  # Symlink the config
  echo "🔗 Linking $path_dotfile → $path_config"
  ln -sfn "$path_dotfile" "$path_config"
  echo "✅ Done: $directory"
  echo
done
