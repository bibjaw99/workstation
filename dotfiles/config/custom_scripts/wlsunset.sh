#!/usr/bin/bash

if pidof wlsunset; then
   killall wlsunset
else
   wlsunset -T 4001
fi
