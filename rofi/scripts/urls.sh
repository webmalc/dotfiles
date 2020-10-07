#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### Options ###
options='📖       nativecards.pw -nvc\n'
options+='📖       gocorrect.me/messages -gcm\n'
options+='🌎       translate.google.ca -trg\n'
options+='🌎       translate.yandex.ru -try\n'
options+='📩       mail.zoho.eu -zhm\n'
options+='⛅       yandex.com/weather/moscow -ywe\n'
options+='⇄       rutracker.org -rtr\n'
options+='⇄       torrentdownloads.me -trd\n'
options+='⇄       thepiratebay.org -pib\n'
options+='⇄       solidtorrents.net -str\n'
options+='💻       github.com -ghw\n'
options+='💻       github.com/maxi-booking -ghm\n'
options+='🍿       trakt.tv -ttv'

# Variable passed to rofi
status="⮫"
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -theme-str "$status_style" -p "$status")"


if [ -n "$chosen" ]; then
    chosen=${chosen:8}
    chosen=${chosen::-4}
    echo $chosen
    firefox --new-tab "https://$chosen"
    wmctrl -xa "Navigator.Firefox"
fi
