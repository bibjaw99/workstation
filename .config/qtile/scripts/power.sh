#! /bin/sh

chosen=$(printf "Log Out\nSuspend\nRestart\nPower OFF" | rofi -dmenu -i -theme-str '@import "~/.config/rofi/powermenu.rasi"')

case "$chosen" in
	"Log Out") killall qtile ;;
	"Suspend") i3lock -i ~/Pictures/backgrounds/coffee.png && systemctl suspend ;;
	"Restart") systemctl reboot ;;
	"Power OFF") systemctl poweroff ;;
	*) exit 1 ;;
esac
