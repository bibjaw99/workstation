#!/usr/bin/env bash
set -euo pipefail

DIR_OF_THIS_SCRIPT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIR_DOTFILES="$HOME/.local/share/dotfiles/config"
DIR_CONFIG="$HOME/.config"
DIR_BACKUP="$HOME/.config.backup/$(date +"%Y%d%m_%H-%M-%S")"

mkdir -p "$DIR_CONFIG"
mkdir -p "$DIR_BACKUP"

mapfile -t DIR_CONFIGECTORIES < "$DIR_OF_THIS_SCRIPT/config_lists/config_dirs.txt"

# Special configs
WAYBAR_CONFIG="$HOME/.local/share/dotfiles/config/waybar_configs/waybar_block_alt/"
POLYBAR_CONFIG="$HOME/.local/share/dotfiles/config/polybar_configs/polybar_block"

for directory in "${DIR_CONFIGECTORIES[@]}"; do
  target_path="$DIR_CONFIG/$directory"
  # Override config path for special cases
  case "$directory" in
    waybar)
      config_path="$WAYBAR_CONFIG"
      ;;
    polybar)
      config_path="$POLYBAR_CONFIG"
      ;;
    *)
      config_path="$DIR_DOTFILES/$directory"
      ;;
  esac

  echo "▶ Processing $directory..."

  # Check if config source exists
  if [[ ! -d "$config_path" ]]; then
    echo "⚠️  Skipping: Config not found at $config_path"
    continue
  fi

  # If the target is a symlink, remove it
  if [[ -L "$target_path" ]]; then
    echo "🔗 Removing symlink: $target_path"
    rm "$target_path"

  # If it's a real directory, back it up
  elif [[ -d "$target_path" ]] && [[ ! -L "$target_path" ]]; then
    echo "📦 Backing up real directory to: $DIR_BACKUP/$directory"
    mv "$target_path" "$DIR_BACKUP/$directory"

  else
    echo "ℹ️  No existing config at $target_path — no need to backup"
  fi

  # Symlink the config
  echo "🔗 Linking $config_path → $target_path"
  ln -sfn "$config_path" "$target_path"
  echo "✅ Done: $directory"
  echo
done
