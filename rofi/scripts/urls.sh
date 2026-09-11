#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### language ###
options='📖       nativecards.pw -nvc\n'
options+='🌎       translate.google.com -trg\n'
options+='🌎       www.vocabulary.com/dictionary/randomword -voc\n'

### ai ###
options+='💬       chat.deepseek.com -dch\n'
options+='💬       www.kimi.com -kch\n'
options+='💬       chat.z.ai -zch\n'
options+='💬       chat.qwen.ai -qch\n'

# mail
options+='📩       mail.zoho.eu -zom\n'
# options+='📩       mail.yandex.ru -yam\n'
# options+='📅       calendar.yandex.ru -cal\n'
options+='📅       calendar.zoho.eu -cal\n'

# torrents
options+='⇄       rutor.info -tor\n'
options+='⇄       rutracker.org -tou\n'
options+='⇄       torrentdownloads.me -tod\n'
options+='⇄       thepiratebay.org -top\n'
options+='⇄       solidtorrents.net -tos\n'
options+='⇄       1337x.to -to3\n'

# streaming
options+='🎵       www.internet-radio.com -rad\n'
options+='🎵       zvuk.com -mus\n'
options+='🎵       music.yandex.ru -muy\n'

### projects ###
options+='💻       github.com -ghw\n'
options+='💻       github.com/maxi-booking -ghm\n'
options+='💻       github.com/orgs/maxi-booking/projects/ -gmp\n'
options+='💻       github.com/webmalc?tab=projects -gwp\n'
options+='💻       webmalc.atlassian.net/jira/for-you -jir\n'

### miscellaneous ###
# options+='⛅       www.windy.com/55.909/37.734?55.556,37.734,8,p:cities -wea\n'
options+='⛅       yandex.ru/pogoda/ru?lat=55.909967&lon=37.736745 -wea\n'
options+='🍿       myshows.me/profile/ -ttv\n'
options+='🍿       www.ismyshowcancelled.com/ -isc\n'
options+='🖵       blackscreen.app -blk'

# Variable passed to rofi
status="★"
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -theme-str "$status_style" -p "$status")"

if [ -n "$chosen" ]; then
  chosen=${chosen:8}
  chosen=${chosen::-5}
  if [ "$chosen" == "www.kinopoisk.ru" ]; then
    firefox "ext+container:name=Personal&url=$chosen"
  elif [ "$chosen" == "blackscreen.app" ]; then
    firefox -kiosk -private-window "https://$chosen"
  else
    firefox --new-tab "https://$chosen"
  fi
  wmctrl -xa "Navigator.Firefox"
fi
