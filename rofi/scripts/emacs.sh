#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### Options ###
start="start"
reboot="reboot"
stop="stop"
# Variable passed to rofi
options="$start\n$stop\n$reboot"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -p emacs)"
case $chosen in
    $start)
        systemctl --user start emacs; bash -c " wmctrl -xa emacs.Emacs || emacsclient -nc -s instance1"
        ;;
    $stop)
        systemctl --user stop emacs
        ;;
    $reboot)
        systemctl --user restart emacs
        ;;
esac

