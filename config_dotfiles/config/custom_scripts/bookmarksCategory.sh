#!/usr/bin/env bash
set -euo pipefail

bookmarksDir="$HOME/.local/share/config_dotfiles/bookmarks"

# firefox
BROWSER="firefox-developer-edition --new-tab"
BROWSER_WINDOW="firefox-developer-edition --new-window"
BROWSER_PRIVATE="firefox-developer-edition --private-window"

# BRAVE
# BROWSER="brave --new-tab --url"
# BROWSER_WINDOW="brave --new-window"
# BROWSER_PRIVATE="brave --incognito --new-tab --url"

# Validate bookmarks directory
[[ -d "$bookmarksDir" ]] || {
  notify-send "Bookmarks directory not found: $bookmarksDir" 2>/dev/null || true
  exit 1
}

mode="${1:-browser}"
case "$mode" in
  browser|window|private) ;;
  *)
    notify-send "Invalid argument: $mode" 2>/dev/null || true
    exit 1
    ;;
esac

case "$mode" in
  browser) cmd=$BROWSER ;;
  window)  cmd=$BROWSER_WINDOW ;;
  private) cmd=$BROWSER_PRIVATE ;;
esac

mapfile -t files < <(
  find "$bookmarksDir" -maxdepth 1 -type f -name '*.txt' -printf '%f\n' | sort
)

[[ ${#files[@]} -gt 0 ]] || exit 0

selected_file=$(
  printf '%s\n' "${files[@]}" |
  rofi -dmenu -i -no-custom -p "Bookmarks" \
    -theme-str 'window { width: 25%; }'
)

[[ -n "$selected_file" ]] || exit 0

file_path="$bookmarksDir/$selected_file"

mapfile -t bookmarks < <(
  sed 's/^[[:space:]]*//;s/[[:space:]]*$//;/^$/d' "$file_path"
)

[[ ${#bookmarks[@]} -gt 0 ]] || exit 0

selected=$(
  printf '%s\n' "${bookmarks[@]}" |
    rofi -dmenu -i -no-custom -p "$(basename $selected_file .txt)" \
    -theme-str 'window { width: 50%; }'
)

[[ -n "$selected" ]] || exit 0

setsid $cmd "$selected" >/dev/null 2>&1 &
