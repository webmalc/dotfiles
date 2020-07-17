#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### Options ###
start_text="   start"
start_icon="\0icon\x1fmedia-playback-start"
start="$start_text$start_icon"

stop_text="   stop"
stop_icon="\0icon\x1fmedia-playback-stop"
stop="$stop_text$stop_icon"

options="$start\n$stop"


if pgrep -x "mpv" > /dev/null
then
    status="🎝"
    status_style="#prompt { background-color: @on; }"
else
    status="🎝"
    status_style="#prompt { background-color: @off; }"
fi
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -theme-str "$status_style" -p "$status")"

echo $chosen
case $chosen in
    $start_text)
        systemctl --user stop mpv; systemctl --user start mpv
    ;;
    $stop_text)
        systemctl --user stop mpv
    ;;
esac

