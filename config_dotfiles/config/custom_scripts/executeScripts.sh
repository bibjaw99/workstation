#!/usr/bin/env bash
set -Eeuo pipefail

scriptsDir="$HOME/.local/share/config_dotfiles/config/custom_scripts/executables"

selected_script=$(
  find "$scriptsDir" -maxdepth 1 -type f -executable ! -name '.*' -printf '%f\n' |
  sort |
  rofi -dmenu -i -matching fuzzy -p "scripts"
)

[[ -z "${selected_script:-}" ]] && exit 0

"$scriptsDir/$selected_script"
