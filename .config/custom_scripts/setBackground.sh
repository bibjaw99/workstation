#!/bin/bash

bgFolder="$HOME/Pictures/backgrounds/"
bg=$(cat "$HOME/.cache/wall.txt")
default_bg="$HOME/.config/walls/wall.png"

if [[ -z "$bg" ]]
then
  swaybg -i "$default_bg" -m fill
else
  swaybg -i "$bgFolder$bg" -m fill
fi
