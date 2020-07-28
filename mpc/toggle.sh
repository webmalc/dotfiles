#!/bin/bash
mpc toggle
status="$(mpc status)"
if echo "$status" | grep -q "playing"; then
    header="PLAYING"
    systemctl --user stop mpv; systemctl --user start mpv
else
    header="STOPPED"
    systemctl --user stop mpv
fi
notify-send "$header" "$(mpc status)"