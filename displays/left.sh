#!/bin/sh
(killall conky -q) 2> /dev/null
xrandr --output eDP-1-1 --mode 1920x1080 --rate 60 --output HDMI-0 --off
/home/webmalc/Projects/dotfiles/conky/conky_left.sh