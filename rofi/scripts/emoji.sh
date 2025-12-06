#!/bin/bash

rofi_command="rofi -theme themes/appsmenu.rasi"

### language ###
options=':)    -    smile, happy, face\n'
options=':‑)    -    smiley, happy, face\n'
options+=':)    -    smiley, happy, face\n'
options+=':-]    -    smiley, happy, face\n'
options+=':]    -    smiley, happy, face\n'
options+=':->    -    smiley, happy, face\n'
options+=':>    -    smiley, happy, face\n'
options+='8-)    -    smiley, happy, face\n'
options+='8)    -    smiley, happy, face\n'
options+=':-}    -    smiley, happy, face\n'
options+=':}    -    smiley, happy, face\n'
options+=':^)    -    smiley, happy, face\n'
options+='=]    -    smiley, happy, face\n'
options+='=)    -    smiley, happy, face\n'

options+=':‑D    -    laughing, big, grin\n'
options+=':D    -    laughing, big, grin\n'
options+='8‑D    -    laughing, big, grin\n'
options+='8D    -    laughing, big, grin\n'
options+='=D    -    laughing, big, grin\n'
options+='=3    -    laughing, big, grin\n'
options+='B^D    -    laughing, big, grin\n'
options+='c:    -    laughing, big, grin\n'

options+='x‑D    -    laughing\n'
options+='xD    -    laughing\n'
options+='X‑D    -    laughing\n'
options+='XD    -    laughing\n'

options+=':‑(    -    frown, sad, pouting\n'
options+=':(    -    frown, sad, pouting\n'
options+=':‑c    -    frown, sad, pouting\n'
options+=':c    -    frown, sad, pouting\n'
options+=':‑<    -    frown, sad, pouting\n'
options+=':<    -    frown, sad, pouting\n'
options+=':‑[    -    frown, sad, pouting\n'
options+=':[    -    frown, sad, pouting\n'
options+=':-||    -    frown, sad, pouting\n'
options+=':{    -    frown, sad, pouting\n'
options+=':@    -    frown, sad, pouting\n'

options+=":\'‑(    -    crying\n"
options+=":\'(    -    crying\n"
options+=':=(    -    crying\n'

options+=":\'-)    -    tears, happiness\n"
options+=":\')    -    tears, happiness\n"
options+=':"D    -    tears, happiness\n'

options+='>:‑O    -    surprise, shock\n'
options+='>:O    -    surprise, shock\n'

options+=';‑)    -    wink, smirk\n'
options+=';)    -    wink, smirk\n'
options+='*-)    -    wink, smirk\n'
options+='*)    -    wink, smirk\n'
options+=';‑]    -    wink, smirk\n'
options+=';]    -    wink, smirk\n'
options+=';^)    -    wink, smirk\n'
options+=';>    -    wink, smirk\n'
options+=':‑,    -    wink, smirk\n'
options+=';D    -    wink, smirk\n'
options+=';3    -    wink, smirk\n'

options+=':‑P    -    tongue, sticking, out, cheeky, playful\n'
options+=':P    -    tongue, sticking, out, cheeky, playful\n'
options+='X‑P    -    tongue, sticking, out, cheeky, playful\n'
options+='XP    -    tongue, sticking, out, cheeky, playful\n'
options+='x‑p    -    tongue, sticking, out, cheeky, playful\n'
options+='xp    -    tongue, sticking, out, cheeky, playful\n'
options+=':‑p    -    tongue, sticking, out, cheeky, playful\n'
options+=':p    -    tongue, sticking, out, cheeky, playful\n'
options+=':‑Þ    -    tongue, sticking, out, cheeky, playful\n'
options+=':Þ    -    tongue, sticking, out, cheeky, playful\n'
options+=':‑þ    -    tongue, sticking, out, cheeky, playful\n'
options+=':þ    -    tongue, sticking, out, cheeky, playful\n'
options+=':‑b    -    tongue, sticking, out, cheeky, playful\n'
options+=':b    -    tongue, sticking, out, cheeky, playful\n'
options+='d:    -    tongue, sticking, out, cheeky, playful\n'
options+='=p    -    tongue, sticking, out, cheeky, playful\n'
options+='>:b    -    tongue, sticking, out, cheeky, playful\n'

options+=':‑/    -    skeptical, annoyed, undecided, uneasy, hesitant\n'
options+=':/    -    skeptical, annoyed, undecided, uneasy, hesitant\n'
options+="\',:^I    -    skeptical, annoyed, undecided, uneasy, hesitant\n"
options+='>:\\    -    skeptical, annoyed, undecided, uneasy, hesitant\n'
options+='>:/    -    skeptical, annoyed, undecided, uneasy, hesitant\n'
options+=':\\    -    skeptical, annoyed, undecided, uneasy, hesitant\n'
options+='=/    -    skeptical, annoyed, undecided, uneasy, hesitant\n'
options+='=\\    -    skeptical, annoyed, undecided, uneasy, hesitant\n'
options+=':L    -    skeptical, annoyed, undecided, uneasy, hesitant\n'
options+='=L    -    skeptical, annoyed, undecided, uneasy, hesitant\n'
options+=':S    -    skeptical, annoyed, undecided, uneasy, hesitant\n'

options+='O:‑)    -    angel, halo, saint, innocent\n'
options+='O:)    -    angel, halo, saint, innocent\n'
options+='0:‑3    -    angel, halo, saint, innocent\n'
options+='0:3    -    angel, halo, saint, innocent\n'
options+='0:‑)    -    angel, halo, saint, innocent\n'
options+='0:)    -    angel, halo, saint, innocent\n'
options+='0;^)    -    angel, halo, saint, innocent\n'

# Other Western / Horizontal Emoticons [citation:1]
options+='<3    -    heart\n'
options+='s2    -    heart\n'
options+='</3    -    broken, heart\n'
options+='<\\3    -    broken, heart\n'

options+='o/    -    waving, hello, half, of, high, five\n'
options+='\\o    -    waving, hello, half, of, high, five\n'
options+='\\o/    -    cheer, yay, yay\n'
options+='o7    -    salute\n'

# Eastern / Vertical Style (Written without tilting head) [citation:1]
options+='^_^    -    smiley, happy, kawaii\n'
options+='^.^    -    smiley, happy, kawaii\n'
options+='^5    -    high, five\n'
options+='o/\\o    -    high, five\n'
options+='>_>^^<_<    -    high, five\n'

options+='>_<    -    skeptical, annoyed, undecided, uneasy, hesitant\n'
options+='>.>    -    sideways, look, devious, guilty\n'
options+='<.<    -    sideways, look, devious, guilty\n'
options+='>_>    -    sideways, look, devious, guilty\n'
options+='<_<    -    sideways, look, devious, guilty\n'

options+='T_T    -    crying\n'
options+='T-T    -    crying\n'
options+=';_;    -    crying\n'
options+=";\';\'    -    crying\n"

options+='v.v    -    sadness, great, dismay, disgust\n'
options+='._.    -    sadness, great, dismay, disgust\n'
options+='._.;    -    sadness, great, dismay, disgust\n'

options+='X_X    -    dead, person, fainted\n'
options+='x_x    -    dead, person, fainted\n'
options+='+_+    -    dead, person, fainted\n'
options+='x_X    -    dead, person, fainted\n'
options+='X_x    -    dead, person, fainted\n'

options+='O_O    -    surprise, shock, yawn\n'
options+='o_o    -    surprise, shock, yawn\n'
options+='O-O    -    surprise, shock, yawn\n'
options+='o‑o    -    surprise, shock, yawn\n'
options+='O_o    -    surprise, shock, yawn\n'
options+='o_O    -    surprise, shock, yawn\n'
options+='(^_^)    -    smiley, happy, kawaii\n'
options+='d^_^b    -    listening, to, music, thumbs, up\n'
options+='d-_-b    -    listening, to, music, thumbs, up\n'
options+='v.v    -    sadness, great, dismay, disgust\n'
options+='._.    -    sadness, great, dismay, disgust\n'
options+='._.;    -    sadness, great, dismay, disgust\n'
options+=';_;    -    crying\n'
options+='T_T    -    crying\n'
options+='T-T    -    crying\n'
options+=">\'<    -    crying\n"
options+='X_X    -    dead, person, fainted\n'
options+='x_x    -    dead, person, fainted\n'
options+='+_+    -    dead, person, fainted\n'
options+='X_x    -    dead, person, fainted\n'
options+='x_X    -    dead, person, fainted\n'
options+='O_O    -    surprise, shock, yawn\n'
options+='o_o    -    surprise, shock, yawn\n'
options+='O-O    -    surprise, shock, yawn\n'
options+='o‑o    -    surprise, shock, yawn\n'
options+='O_o    -    surprise, shock, yawn\n'
options+='o_O    -    surprise, shock, yawn\n'
options+='^5    -    high, five\n'
options+='o/\\o    -    high, five\n'
options+='>_>^ ^<_<    -    high, five\n'
options+='<_<    -    sideways, look, devious, guilty\n'
options+='>_>    -    sideways, look, devious, guilty\n'
options+='<.<    -    sideways, look, devious, guilty\n'
options+='>.>    -    sideways, look, devious, guilty\n'
options+='>_<    -    skeptical, annoyed, undecided, uneasy, hesitant\n'
options+='>.<    -    skeptical, annoyed, undecided, uneasy, hesitant\n'

# 2channel Style Emoticons
options+='(｀-´)>    -    salute, 2ch\n'
options+='(´；ω；｀)    -    terribly, sad, 2ch\n'
options+='ヽ(´ー｀)ﾉ    -    peace, of, mind, 2ch\n'
options+='(`Д´)ﾉ    -    be, irritable, 2ch\n'
options+='(＃ﾟДﾟ)    -    angry, 2ch\n'
options+='（´Д｀）    -    yelling, 2ch\n'
options+='（ﾟДﾟ）    -    loudmouthed, 2ch\n'
options+="（´∀｀）    -    carefree, 2ch\n"
options+='（´_ゝ｀）    -    indifferent, 2ch\n'
options+='Σ(゜д゜;)    -    shocked, 2ch\n'
options+='( ﾟヮﾟ)    -    upbeat\n, 2ch'
options+='(((( ；ﾟДﾟ)))    -    spook, 2ch\n'
options+='Σ(ﾟДﾟ)    -    huge, surprise, 2ch\n'
options+='( ﾟдﾟ)    -    amazed, 2ch\n'
options+='(ﾟДﾟ;≡;ﾟДﾟ)    -    impatience, 2ch\n'
options+='（･∀･)つ⑩    -    carrying, money, 2ch\n'
options+='(ﾟдﾟ)    -    unforeseen, 2ch\n'
options+='（つД｀）    -    sad, face, 2ch\n'
options+='(￣ー￣)    -    simper, snorlax, 2ch\n'
options+='ヽ(´▽｀)/    -    happy, 2ch\n'
options+="(l\'o\'l)    -    shocked, 2ch\n"
options+='ヽ(ｏ`皿′ｏ)ﾉ    -    really, angry, 2ch\n'
options+='(☞ﾟヮﾟ)☞    -    do, it, 2ch\n'
options+='☜(⌒▽⌒)☞    -    angel, 2ch\n'
options+='(*´Д｀)ﾊｧﾊｧ    -    haa, haa, 2ch\n'
options+='＿|￣|○    -    given, up, 2ch\n'
options+='╬ಠ益ಠ)    -    extreme, distaste, 2ch\n'
options+='(≧ロ≦)    -    shouting, 2ch\n'

options+='(╯°□°）╯︵┻━┻    -    flip, table\n'
options+='ʕ•ᴥ•ʔ    -    bear\n'
options+='¯\_(ツ)_/¯    -    shrug\n'
options+='¯\(°_o)/¯    -    shrug\n'
options+='ヽ(´▽`)/    -    hooray\n'
options+='ᕙ(⇀‸↼‶)ᕗ    -    strong, flexing\n'
options+='ᕦ(ò_óˇ)ᕤ    -    strong, flexing\n'
options+='⊙﹏⊙    -    dazzy, ill\n'
options+='(⊙_◎)    -    dazzy, ill, surprise\n'
options+='¯\_(⊙︿⊙)_/¯    -    shrug, sad\n'
options+='ミ●﹏☉ミ    -    crazy\n'
options+='{•̃_•̃}    -    robot\n'
options+='[¬º-°]¬    -    zombie\n'

options+='ε=ε=ε=┌(;*´Д｀)ﾉ    -    running, 2ch'

# Variable passed to rofi
status="\o/"
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0 -theme-str "$status_style" -p "$status")"

if [ -n "$chosen" ]; then
  # Extract only the smile (first word before space)
  smile=$(echo "$chosen" | awk '{print $1}')

  echo -n "$smile" | xclip -selection clipboard
  echo -n "$smile" | xclip -selection primary
  sleep 0.1
  xdotool key ctrl+v
fi
