#!/bin/bash -e
amixer -c 2 sset Mic toggle
CURRENT_SOURCE="A4tech"
ISMUTE=$(pactl list sources | grep -A 10 $CURRENT_SOURCE | grep "Mute:" | cut -d':' -f 2)
if [ $ISMUTE == "no" ]
then
    notify-send "Microphone is enabled"
else
    notify-send "Microphone is disabled"
fi