#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi -format p -markup -markup-rows"

### Options ###
start_text="   start"
start_icon="\0icon\x1fmedia-playback-start"
start="<span foreground='#44ad4d'>$start_text</span>$start_icon"

stop_text="   stop"
stop_icon="\0icon\x1fmedia-playback-stop"
stop="<span font_weight='bold' foreground='#e34039'>$stop_text</span>$stop_icon"

options="$start\n$stop"


if pgrep -x "mpv" > /dev/null
then
    status=""
    status_style="#prompt { background-color: @on; }"
else
    status=""
    status_style="#prompt { background-color: @off; }"
fi
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -theme-str "$status_style" -p "$status")"

case $chosen in
    $start_text)
        systemctl --user stop mpv; systemctl --user start mpv
    ;;
    $stop_text)
        systemctl --user stop mpv
    ;;
esac

