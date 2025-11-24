#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### language ###
options='📖       nativecards.pw -nvc\n'
options+='🌎       translate.yandex.ru -try\n'
options+='🌎       deepl.com/translator -trd\n'
options+='🌎       translate.google.ca -trg\n'
options+='🌎       www.vocabulary.com/dictionary/randomword -voc\n'

### ai ###
options+='💬       www.bing.com/search?toWww=1&redig=F08C5B7460244EC58845E960D801C8BC&q=Bing+AI&showconv=1 -bin\n'
options+='💬       bard.google.com/chat -bar\n'
options+='💬       chatgpt.com -gpt\n'
options+='💬       giga.chat/gigachat -gig\n'
options+='💬       chat.deepseek.com -see\n'
options+='💬       duck.ai -dai\n'
options+='💬       grok.com -grk\n'

# mail
#options+='📩       mail.yandex.ru -yhm\n'
#options+='📅       calendar.yandex.ru -cal\n'
options+='📩       mail.zoho.eu -zom\n'
options+='📅       calendar.zoho.eu -cal\n'

# torrents
options+='⇄       rutor.info -tor\n'
options+='⇄       rutracker.org -tou\n'
options+='⇄       torrentdownloads.me -tod\n'
options+='⇄       thepiratebay.org -top\n'
options+='⇄       solidtorrents.net -tos\n'
options+='⇄       1337x.to -to3\n'

# streaming
options+='🍿       www.kinopoisk.ru -kin\n'
options+='🎵       www.internet-radio.com -rad\n'
options+='🎵       music.webmalc.pw/pl/ -mus\n'

### gihub ###
options+='💻       github.com -ghw\n'
options+='💻       github.com/maxi-booking -ghm\n'
options+='💻       github.com/orgs/maxi-booking/projects/ -gmp\n'
options+='💻       github.com/webmalc?tab=projects -gwp\n'

### miscellaneous ###
options+='⛅       yandex.ru/pogoda/mytischi -wea\n'
options+='🍕       www.myfitnesspal.com -ftp\n'
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
