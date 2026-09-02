#!/bin/bash
sleep 0.1
wmctrl -xa Firefox
xdotool key --clearmodifiers alt+$1
