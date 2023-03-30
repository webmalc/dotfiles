#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### language ###
options='📖       nativecards.pw -nvc\n'
options+='📖       gocorrect.me/messages -gcm\n'
options+='🌎       translate.yandex.ru -try\n'
options+='🌎       deepl.com/translator -trd\n'
options+='🌎       translate.google.ca -trg\n'
options+='💬       www.bing.com/search?toWww=1&redig=F08C5B7460244EC58845E960D801C8BC&q=Bing+AI&showconv=1 -cha\n'

# kinopoisk
options+='🍿       www.kinopoisk.ru -kin\n'

# mail
options+='📩       mail.yandex.ru -yhm\n'
options+='📅       calendar.yandex.ru -cal\n'


# torrents
options+='⇄       rutor.info -tor\n'
options+='⇄       rutracker.org -tou\n'
options+='⇄       torrentdownloads.me -tod\n'
options+='⇄       thepiratebay.org -top\n'
options+='⇄       solidtorrents.net -tos\n'
options+='⇄       rarbggo.org -tog\n'
options+='⇄       1337x.to -to3\n'

# streaming
options+='🍿       fmovies.to/home -stv\n'
options+='🍿       flixtor.to/home -stv\n'

### gihub ###
options+='💻       github.com -ghw\n'
options+='💻       github.com/maxi-booking -ghm\n'
options+='💻       github.com/orgs/maxi-booking/projects/7 -ghp\n'


### miscellaneous ###
options+='⛅       yandex.ru/pogoda/mytischi -wea\n'
options+='🍕       www.myfitnesspal.com -ftp\n'
options+='🍿       myshows.me/profile/ -ttv'

# Variable passed to rofi
status="★"
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -theme-str "$status_style" -p "$status")"


if [ -n "$chosen" ]; then
    chosen=${chosen:8}
    chosen=${chosen::-4}
    echo $chosen
    firefox --new-tab "http://$chosen"
    wmctrl -xa "Navigator.Firefox"
fi
