#!/usr/bin/env bash
set -euo pipefail

ZSH_PATH="$(command -v zsh)"

if [ "$SHELL" != "$ZSH_PATH" ]; then
  read -r -p "Your default shell is not zsh. Change it to zsh? [y/N] " reply
  if [[ "$reply" =~ ^[Yy]$ ]]; then
    chsh -s "$ZSH_PATH"
    echo "Default shell changed to zsh."
  else
    echo "Keeping current shell."
  fi
fi
