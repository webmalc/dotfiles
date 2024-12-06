#!/bin/sh
(killall conky -q) 2> /dev/null
# xrandr --output HDMI-0 --off --output DP-0 --off --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output DP-3 --primary --mode 1920x1080 --pos 0x0 --rotate normal
xrandr --output HDMI-0 --off --output DP-0 --off --output DP-1 --off --output HDMI-1 --off --output DP-2 --off
/home/webmalc/Projects/dotfiles/conky/conky.sh
