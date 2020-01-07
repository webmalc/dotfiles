#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### Options ###
power_off="poweroff"
reboot="reboot"
lock="lock"
suspend="suspend"
log_out="logout"
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -p "⏻")"
case $chosen in
    $power_off)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        cinnamon-screensaver-command -l
        ;;
    $suspend)
        systemctl suspend
        ;;
    $log_out)
        gnome-session-quit --logout --no-prompt
        ;;
esac

