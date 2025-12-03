#!/usr/bin/env bash
set -euo pipefail

# Define constants
dir_of_this_script="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dir_config="$HOME/.config"
dir_backup="$HOME/.config.backup/$(date +"%Y%m%d_%H-%M-%S")"
mkdir -p "$dir_backup"

# Define config source paths
starship_config="$HOME/.local/share/config_dotfiles/config/starship.toml"
mimeapps_list="$HOME/.local/share/config_dotfiles/config/mimeapps.list"
zsh_config="$HOME/.local/share/config_dotfiles/zshrc"
bash_config="$HOME/.local/share/config_dotfiles/bashrc"
vim_config="$HOME/.local/share/config_dotfiles/vimrc"
tmux_config="$HOME/.local/share/config_dotfiles/tmux.conf"
global_alias="$HOME/.local/share/config_dotfiles/alias"

# Read the list of config files to install
mapfile -t config_files < "$dir_of_this_script/config_lists/config_files.txt"

for file in "${config_files[@]}"; do
  case "$file" in
    "starship.toml")
      target="$dir_config/$file"
      source="$starship_config"
      ;;
    "mimeapps.list")
      target="$dir_config/$file"
      source="$mimeapps_list"
      ;;
    ".alias")
      target="$HOME/$file"
      source="$global_alias"
      ;;
    ".zshrc")
      target="$HOME/$file"
      source="$zsh_config"
      ;;
    ".bashrc")
      target="$HOME/$file"
      source="$bash_config"
      ;;
    ".vimrc")
      target="$HOME/$file"
      source="$vim_config"
      ;;
    ".tmux.conf")
      target="$HOME/$file"
      source="$tmux_config"
      ;;
    *)
      echo "⚠️  Invalid config entry: $file"
      continue
      ;;
  esac

  echo "▶ Processing $file"

  if [[ -L "$target" ]]; then
    echo "🔗 Removing existing symlink: $target"
    rm "$target"
  elif [[ -e "$target" ]]; then
    echo "📦 Backing up: $target → $dir_backup/"
    mv "$target" "$dir_backup/"
  else
    echo "ℹ️  No existing file at $target"
  fi

  echo "🔗 Linking $source → $target"
  ln -sfn "$source" "$target"
  echo "✅ Done: $file"
  echo
done
