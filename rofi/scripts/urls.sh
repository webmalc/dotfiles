#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### Options ###
options='📖       nativecards.pw\n'
options+='🌎       translate.yandex.ru\n'
options+='🌎       translate.google.ca\n'
options+='📩       mail.zoho.eu\n'
options+='⛅       yandex.com/weather/moscow\n'
options+='🔍       unogs.com\n'
options+='🅽       netflix.com\n'
options+='🍿       trakt.tv'

# Variable passed to rofi
status="⮫"
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -theme-str "$status_style" -p "$status")"


if [ -n "$chosen" ]; then
    chosen=${chosen:8}
    firefox --new-tab "https://$chosen"
    wmctrl -xa "Navigator.Firefox"
fi