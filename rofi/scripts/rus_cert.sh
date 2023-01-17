#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### Options ###
install="install"
remove="remove"
# Variable passed to rofi
options="$install\n$remove"


active=false
if [ -d "/usr/local/share/ca-certificates/russian" ]; then
    active=true
fi
if [ "$active" = true ]; then
    status="certificates"
    status_style="#prompt { background-color: @on; }"
else
    status="certificates"
    status_style="#prompt { background-color: @off; }"
fi
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -theme-str "$status_style" -p "$status")"

case $chosen in
    $install)
        pkexec /home/webmalc/Projects/dotfiles/cert/rus_cert.sh install
    ;;
    $remove)
        pkexec /home/webmalc/Projects/dotfiles/cert/rus_cert.sh remove
    ;;
esac

