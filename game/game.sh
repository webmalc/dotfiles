#!/bin/sh
xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --output HDMI-1 --off
while true; do
  pkill -f telegram-desktop
  sleep 0.5
done