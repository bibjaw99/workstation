#! /bin/sh

# Detect whether we're running on Xorg or Wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    suspend="systemctl suspend && swaylock -i ~/.config/walls/wall.png"
else
    suspend="systemctl suspend && i3lock -i ~/.config/walls/wall.png"
fi

# special method for loggin out :(
if [ "$DESKTOP_SESSION" = "i3" ]; then
    logout="killall i3"
  elif [ "$DESKTOP_SESSION" = "hyprland" ]; then
    logout="killall Hyprland"
  elif [ "$DESKTOP_SESSION" = "sway" ]; then
    logout="killall sway"
  else
    logout="loginctl terminate-user $USER"
fi

chosen=$(printf "Log Out\nSuspend\nRestart\nPower OFF\n" | rofi -dmenu -i -theme-str '@import "~/.config/rofi/themes/powermenu.rasi"')

# Perform the action based on user choice
case "$chosen" in
    "Log Out") $logout ;;
    "Suspend") eval $suspend ;;
    "Restart") systemctl reboot ;;
    "Power OFF") systemctl poweroff ;;
    *) exit 1 ;;
esac
