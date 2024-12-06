#!/bin/sh
(killall conky -q) 2> /dev/null
xrandr --output DP-1 --primary --mode 1920x1080 --rate 60 --output HDMI-0 --mode  1920x1080 --right-of DP-1
/home/webmalc/Projects/dotfiles/conky/conky.sh