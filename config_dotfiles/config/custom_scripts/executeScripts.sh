#!/usr/bin/env bash

scriptsDir="$HOME/.local/share/config_dotfiles/config/custom_scripts/executables"

selected_script=$(
  find "$scriptsDir" -maxdepth 1 -type f -executable ! -name '.*' -printf '%f\n' |
  sort |
  rofi -dmenu -i -matching fuzzy -p "Scripts"
)

[[ -z "${selected_script:-}" ]] && exit 0

"$scriptsDir/$selected_script"
