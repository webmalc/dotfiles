#!/bin/bash
rofi_command="rofi -theme themes/appsmenu.rasi -dmenu -lines 25 -no-custom -format p -markup -markup-rows"
stop="⏹  stop"
report="☰  report"
log="☰  log"
no_project="No project started."
terminal_command="xfce4-terminal --hide-menubar --maximize --hide-borders --hide-scrollbar --title webmalc-ncmpcpp -e"
while IFS=, read -r from to project tag time; do
    if [ "$from" != "from" ] && [ "$tag" != "" ]
    then
        options="$options\n<span font_weight='bold'>$project</span> <span font_style='italic'>+$tag</span>"
    fi;
done <<< `watson report -s -g`
options="$options\n<span foreground='#44ad4d'>$report</span>"
options="$options\n<span foreground='#44ad4d'>$log</span>"
status=`watson status -p`

if [ "$status" = "$no_project" ]
then
    status="⏹   stopped"
    status_style="#prompt { background-color: @off; }"
    options=`echo "$options" | cut -c 3-`
else
    status_project=`watson status -p`
    status_tag=`watson status -t`
    status_elapsed=`watson status -e`
    status="   $status_project $status_tag $status_elapsed"
    status_style="#prompt { background-color: @on; }"
    options="<span font_weight='bold' foreground='#e34039'>$stop</span>$options"
fi
chosen="$(echo -e "$options" | $rofi_command -theme-str "$status_style" -p "$status")"

case $chosen in
    $stop)
        output=`watson stop`
    ;;
    $report)
        `$terminal_command "watson report"`
    ;;
    $log)
        `$terminal_command "watson log"`
    ;;
    "")
        output=""
    ;;
    *)
        output=`watson start $chosen`
    ;;
esac

if [ "$output" != "" ]
then
    notify-send "Watson" "$output"
fi
