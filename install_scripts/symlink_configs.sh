#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="$HOME/.local/share/dotfiles/config"
TARGET_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config.backup/$(date +"%Y%d%m_%H-%M-%S")"
mkdir -p "$BACKUP_DIR"

mapfile -t DIRECTORIES < config_dirs.txt

# Special configs
WAYBAR_CONFIG="$HOME/.local/share/dotfiles/config/waybar_configs/waybar_underline"
POLYBAR_CONFIG="$HOME/.local/share/dotfiles/config/polybar_configs/polybar_underline"

for directory in "${DIRECTORIES[@]}"; do
  target_path="$TARGET_DIR/$directory"
  # Override config path for special cases
  case "$directory" in
    waybar)
      config_path="$WAYBAR_CONFIG"
      ;;
    polybar)
      config_path="$POLYBAR_CONFIG"
      ;;
    *)
      config_path="$CONFIG_DIR/$directory"
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
    echo "📦 Backing up real directory to: $BACKUP_DIR/$directory"
    mv "$target_path" "$BACKUP_DIR/$directory"

  else
    echo "ℹ️  No existing config at $target_path — no need to backup"
  fi

  # Symlink the config
  echo "🔗 Linking $config_path → $target_path"
  ln -sfn "$config_path" "$target_path"
  echo "✅ Done: $directory"
  echo
done
