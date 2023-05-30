#!/bin/bash
picom &
xrandr -s 1920x1080 -r 75 
xset s -dpms 
xset s off
nitrogen --restore
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
