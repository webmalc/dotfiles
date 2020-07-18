#!/bin/sh
(killall conky -q) 2> /dev/null
xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --output eDP-1-1 --off
/home/webmalc/Projects/dotfiles/conky/conky_left.sh