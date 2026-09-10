#!/usr/bin/env bash

BOOKMARKS_DIRECTORY="$HOME/.local/share/config_dotfiles/bookmarks"

# browser modes
TAB_MODE="firefox-developer-edition --new-tab"
WINDOW_MODE="firefox-developer-edition --new-window"
PRIVATE_MODE="firefox-developer-edition --private-window"

# BRAVE
# TAB_MODE="brave --new-tab --url"
# WINDOW_MODE="brave --new-window"
# PRIVATE_MODE="brave --incognito --new-tab --url"

# validate directory
if [[ ! -d "$BOOKMARKS_DIRECTORY" ]];then 
  notify-send -u critical "Create your bookmarks.text file in $BOOKMARKS_DIRECTORY" 2>/dev/null
  exit 1
fi

# browser command based on the mode, default is tab mode
browser_mode="${1:-tab}"
case "$browser_mode" in
  tab) browser_command=$TAB_MODE ;;
  window)  browser_command=$WINDOW_MODE ;;
  private) browser_command=$PRIVATE_MODE ;;
  *)
    notify-send "Invalid mode:'$browser_mode', try tab widnow or private" 2>/dev/null
    exit 1
    ;;
esac

# function to remove empty spaces and lines from a given array
remove_empty_lines_and_spaces() {
  sed -E 's/^[[:space:]]*//;s/[[:space:]]*$//;/^$/d' "$@"
}

# selection_mode : all or category : by default show all bookmarks
bookmarks_selection_mode="${2:-all}"
# selecting bookmarks
if [[ "$bookmarks_selection_mode" == "all" ]]; then
  # store all the bookmarks
  mapfile -t bookmarks < <(remove_empty_lines_and_spaces "$BOOKMARKS_DIRECTORY"/*.txt)
  # exit if bookmarks is empty
  [[ ${#bookmarks[@]} -gt 0 ]] || exit 0
  selected=$(printf '%s\n' "${bookmarks[@]}" | sort | fuzzel --dmenu --prompt="Bookmarks: " --width=80)
else
  # store available categories file in an array
  mapfile -t categories < <(find "$BOOKMARKS_DIRECTORY" -maxdepth 1 -type f -name "*.txt" -printf "%f\n")
  # if there's no category file then exit
  [[ ${#categories[@]} -gt 0 ]] || exit 0
  # print available bookmark of a category
  selected_category=$(printf '%s\n' "${categories[@]}" | sort | fuzzel --dmenu --prompt="Categories: " --width=80)
  # exit if there is no selected category
  [[ -n "$selected_category" ]] || exit 0
  # file path of the selected category
  selected_category_file="$BOOKMARKS_DIRECTORY/$selected_category"
  # bookmarks in selected category
  mapfile -t bookmarks < <(remove_empty_lines_and_spaces "$selected_category_file")
  # exit if no category is selected
  [[ ${#bookmarks[@]} -gt 0 ]] || exit 0
  # available bookmarks in selected category
  selected=$(printf '%s\n' "${bookmarks[@]}" | sort | fuzzel --dmenu --prompt="$selected_category: " --width=80)
fi

# exit if nothing is selected
[[ -n "$selected" ]] || exit 0

setsid $browser_command "$selected" >/dev/null 2>&1 &
