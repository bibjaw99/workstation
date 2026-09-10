#!/usr/bin/env bash

switch_waybar_themes() {
  local waybar_themes_directory="$HOME/.local/share/config_dotfiles/config/waybar_configs"
  local waybar_config_directory="$HOME/.config/waybar"
  local waybar_themes
  local selected_waybar_theme
  local selected_path

  # store theme directories in an array
  mapfile -t waybar_themes < <(
    find "$waybar_themes_directory" -mindepth 1 -maxdepth 1 -type d -printf "%f\n"
  )

  # theme selection prompt
  selected_waybar_theme="$(
    printf "%s\n" "${waybar_themes[@]}" |
    sort |
    fuzzel --dmenu --prompt="Themes: "
  )"

  # notify if a theme is not selected
  if [[ -z "$selected_waybar_theme" ]];then
    return 0
  fi
  
  # full selected path
  selected_path="$waybar_themes_directory/$selected_waybar_theme"

  # handle wrong theme name
  [[ -d "$selected_path" ]] || {
    notify-send "Waybar" "Config \"$selected_waybar_theme\" not found"
    return 1
  }

  # check if link is already selected
  if [[ -L "$waybar_config_directory" ]];then
    if [[ "$(readlink -f "$waybar_config_directory")" == "$(readlink -f "$selected_path")" ]]; then
      notify-send "Waybar" "Already using: $selected_waybar_theme"
      return 0
    fi
  fi

  # create symlink or replace with existing one
  ln -sfn "$selected_path" "$waybar_config_directory"

  # restart waybar session
  pkill -x waybar 2>/dev/null || true
  sleep 1

  # reload depending on the window manager
  if [[ "$XDG_CURRENT_DESKTOP" == "sway:wlroots" ]];then
    swaymsg reload
  else
    waybar & disown
  fi
}

switch_waybar_themes
