#!/usr/bin/env bash
set -euo pipefail

CONFIG_ROOT="$HOME/.local/share/config_dotfiles/config/firefox"

USER_JS_SOURCE="$CONFIG_ROOT/user.js"
CHROME_SOURCE="$CONFIG_ROOT/chrome"

FIREFOX_PROFILE_ROOT="$HOME/.config/mozilla/firefox"
PROFILE_GLOB="*.dev-edition-default"

shopt -s nullglob
PROFILES=("$FIREFOX_PROFILE_ROOT"/$PROFILE_GLOB)
shopt -u nullglob

if [[ ${#PROFILES[@]} -eq 0 ]]; then
  notify-send -u low "Firefox config not found" \
    "Launch Firefox Developer Edition once to create the profile directory."
  exit 1
fi

for profile in "${PROFILES[@]}"; do
  USER_JS_TARGET="$profile/user.js"
  CHROME_TARGET="$profile/chrome"

  rm -f "$USER_JS_TARGET"
  ln -s "$USER_JS_SOURCE" "$USER_JS_TARGET"

  rm -rf "$CHROME_TARGET"
  ln -s "$CHROME_SOURCE" "$CHROME_TARGET"
done

notify-send "Firefox configs updated"
