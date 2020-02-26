#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### Options ###
start="start"
reboot="reboot"
stop="stop"
options="$start\n$stop\n$reboot"


if pgrep -x "mpv" > /dev/null
   then
       status="mpv"
       status_style="#prompt { background-color: @on; }"
   else
       status="mpv"
       status_style="#prompt { background-color: @off; }"
   fi
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -theme-str "$status_style" -p "$status")"

case $chosen in
    $start)
        killall mpv; mpv https://music.webmalc.pw
        ;;
    $stop)
        killall mpv
        ;;
    $reboot)
        killall mpv; mpv https://music.webmalc.pw
        ;;
esac

