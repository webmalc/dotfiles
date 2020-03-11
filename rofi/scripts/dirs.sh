#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### Options ###
base_dir="/home/webmalc/Projects/"
options="$(ls $base_dir)"

# Variable passed to rofi
status="🖿"
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -theme-str "$status_style" -p "$status")"


if [ -n "$chosen" ]; then
    xfce4-terminal --hide-menubar --maximize --hide-borders --hide-scrollbar --title webmalc-ranger -e "ranger $base_dir$chosen"
    wmctrl -xa "webmalc-ranger"
fi