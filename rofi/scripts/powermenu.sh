#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### Options ###
power_off_text="   poweroff"
power_off_icon="\0icon\x1fsystem-shutdown"
power_off="$power_off_text$power_off_icon"

reboot_text="   reboot"
reboot_icon="\0icon\x1fsystem-reboot"
reboot="$reboot_text$reboot_icon"

lock_text="   lock"
lock_icon="\0icon\x1fsystem-lock-screen"
lock="$lock_text$lock_icon"


suspend_text="   suspend"
suspend_icon="\0icon\x1fsystem-suspend"
suspend="$suspend_text$suspend_icon"

log_out_text="   logout"
log_out_icon="\0icon\x1fsystem-log-out"
log_out="$log_out_text$log_out_icon"

# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -show-icons -icon-theme "Papirus" -selected-row 0 -p "⏻")"
case $chosen in
    $power_off_text)
        mpc stop
        watson stop
        systemctl poweroff
    ;;
    $reboot_text)
        mpc stop
        watson stop
        systemctl reboot
    ;;
    $lock_text)
        cinnamon-screensaver-command -l
    ;;
    $suspend_text)
        mpc stop
        watson stop
        systemctl suspend
    ;;
    $log_out_text)
        mpc stop
        watson stop
        gnome-session-quit --logout --no-prompt
    ;;
esac

