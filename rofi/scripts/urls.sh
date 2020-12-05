#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### language ###
options='📖       nativecards.pw -nvc\n'
options+='📖       gocorrect.me/messages -gcm\n'
options+='🌎       translate.google.ca -trg\n'
options+='🌎       translate.yandex.ru -try\n'

# zoho
options+='📩       mail.zoho.eu -zhm\n'
options+='📅       calendar.zoho.eu -cal\n'


# torrents
options+='⇄       rutracker.org -tou\n'
options+='⇄       torrentdownloads.me -tod\n'
options+='⇄       thepiratebay.org -top\n'
options+='⇄       solidtorrents.net -tos\n'
options+='⇄       rarbggo.org -tor\n'
options+='⇄       1337x.to -to3\n'

### gihub ###
options+='💻       github.com -ghw\n'
options+='💻       github.com/maxi-booking -ghm\n'


### miscellaneous ###
options+='⛅       weather.com/weather/tenday/l/34f2aafc84cff75ae0b014754856ea5e7f8ddf618cf9735549dfb5e016c28e10 -wea\n'
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
