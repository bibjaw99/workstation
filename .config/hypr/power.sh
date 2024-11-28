#! /bin/sh

chosen=$(printf "Log Out\nSuspend\nRestart\nPower OFF" | rofi -dmenu -i -theme-str '@import "~/.config/rofi/powermenu.rasi"')

case "$chosen" in
	"Log Out") hyprctl dispatch exit ;;
	"Suspend") systemctl suspend && swaylock -i ~/Pictures/backgrounds/VIM.png ;;
	"Restart") systemctl reboot ;;
	"Power OFF") systemctl poweroff ;;
	*) exit 1 ;;
esac
