#!/bin/bash

disconnect() {
    nmcli con down id "$active" && notify-send "Network Manager" "Disconnected from $active" || notify-send "Network Manager" "Error disconnecting from $active!"
}
connect() {
    rm -f "/tmp/vpn_paused"
    nmcli con up id "$chosen" && notify-send "Network Manager" "Now connected to $chosen" || notify-send "Network Manager" "Error connecting to $chosen!"
}

# Get the active vpn connection if there's one
active="$(nmcli -g name,type con show --active | grep vpn | sed -e 's#:vpn$##')"
paused=""
timeout=600
pause_option="<span foreground='#e34039'>⏼︎    pause</span>"
if [ -f "/tmp/vpn_paused" ]; then
    counter=$(</tmp/vpn_paused)
    now=$(date +%s)
    remain=$(($now-$counter))
    remain=$(($timeout-$remain))
    remain=$(($remain/60))
    paused=" [paused $remain min left]"
fi


# Get the list of vpns
mapfile -t list < <(nmcli -g name,type con | grep vpn | sed -e 's#:vpn$##')
# A vpn is active
if [ -n "$active" ]; then
    status="   connected to $active"
    status_style="#prompt { background-color: @on; }"
    # special="-a 0 -selected-row 1"
    special=""
    # Variable passed to rofi
    options="   $active"
    for i in "${!list[@]}"; do
        [ "${list[i]}" == "$active" ] && unset "list[i]" || options+="\n${list[i]}"
    done
    suspend_icon="\0icon\x1fsystem-suspend"
    options="$pause_option\n$options"
    # No vpn is active
else
    status="   disconnected$paused"
    status_style="#prompt { background-color: @off; }"
    special=""
    # Variable passed to rofi
    options=""
    for i in "${!list[@]}"; do
        options+="${list[i]}\n"
    done
    options=${options::-2}
fi



chosen=$(echo -e "$options" | rofi -theme themes/appsmenu.rasi -markup -markup-rows -theme-str "$status_style" -p "$status" -dmenu -i $special)
if [ -n "$chosen" ]; then
    if [ "$chosen" == "   $active" ]; then
        # Disconnect the active vpn
        disconnect
        elif [ "$chosen" == "$pause_option" ]; then
        disconnect
        echo $(date +%s) > "/tmp/vpn_paused"
        sleep $timeout
        chosen=$active
        if [ -f "/tmp/vpn_paused" ]; then
            rm -f "/tmp/vpn_paused"
            connect
        fi
    else
        take_action=false
        # Check if the chosen option is in the list, to avoid taking action
        # on the user pressing Escape for example
        for i in "${!list[@]}"; do
            [ "${list[i]}" == "$chosen" ] && { take_action=true; break; }
        done
        if $take_action; then
            # A vpn is active
            if [ -n "$active" ]; then
                # Disconnect the active vpn
                disconnect
                wait
                sleep 1
                # Connect to the chosen one
                connect
                # No vpn is active
            else
                # Connect to the chosen one
                connect
            fi
        fi
    fi
fi

