#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### Options ###
ncmpcpp="ncmpcpp"
start="start"
reboot="reboot"
stop="stop"
options="$ncmpcpp\n$start\n$stop\n$reboot"


if pgrep -x "mpv" > /dev/null
then
    status="🎝"
    status_style="#prompt { background-color: @on; }"
else
    status="🎝"
    status_style="#prompt { background-color: @off; }"
fi
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -theme-str "$status_style" -p "$status")"

case $chosen in
    $start)
        systemctl --user stop mpv; systemctl --user start mpv
    ;;
    $ncmpcpp)
        /home/webmalc/Projects/dotfiles/wmctrl/switch.sh webmalc-ncmpcpp "xfce4-terminal --hide-menubar --maximize --hide-borders --hide-scrollbar --title webmalc-ncmpcpp -e ncmpcpp"
    ;;
    $stop)
        systemctl --user stop mpv
    ;;
    $reboot)
        systemctl --user stop mpv; systemctl --user start mpv
    ;;
esac

