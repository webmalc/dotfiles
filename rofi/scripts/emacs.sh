#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### Options ###
start="start"
reboot="reboot"
stop="stop"
update="update"
# Variable passed to rofi
options="$start\n$stop\n$reboot\n$update"


active="$(systemctl --user status emacs | grep running)"
if [ -n "$active" ]; then
    status="emacs"
    status_style="#prompt { background-color: @on; }"
else
    status="emacs"
    status_style="#prompt { background-color: @off; }"
fi
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -theme-str "$status_style" -p "$status")"

case $chosen in
    $start)
        systemctl --user start emacs; bash -c " wmctrl -xa emacs.Emacs || emacsclient -nc -s instance1"
        ;;
    $stop)
        killall emacs; systemctl --user stop emacs
        ;;
    $reboot)
        killall emacs; systemctl --user restart emacs; bash -c " wmctrl -xa emacs.Emacs || emacsclient -nc -s instance1"
        ;;
    $update)
        killall emacs; git pull --rebase ~/.emacs.d/; systemctl --user restart emacs; bash -c " wmctrl -xa emacs.Emacs || emacsclient -nc -s instance1"
        ;;
esac

