#!/usr/bin/env bash
set -euo pipefail

bookmarksDir="$HOME/.local/share/bookmarks"

BROWSER="firefox-developer-edition --new-tab"
BROWSER_WINDOW="firefox-developer-edition --new-window"
BROWSER_PRIVATE="firefox-developer-edition --private-window"

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

mapfile -t bookmarks < <(
  sed 's/^[[:space:]]*//;s/[[:space:]]*$//;/^$/d' \
    "$bookmarksDir"/*.txt 2>/dev/null
)

[[ ${#bookmarks[@]} -gt 0 ]] || exit 0

selected=$(
  printf '%s\n' "${bookmarks[@]}" |
  rofi -dmenu -i -no-custom -p "Bookmarks" \
    -theme-str 'window { width: 50%; }'
)

[[ -n "$selected" ]] || exit 0

case "$mode" in
  browser) cmd=$BROWSER ;;
  window)  cmd=$BROWSER_WINDOW ;;
  private) cmd=$BROWSER_PRIVATE ;;
esac

setsid $cmd "$selected" >/dev/null 2>&1 &
