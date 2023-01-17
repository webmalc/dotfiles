#!/bin/bash
if [ -d "/usr/local/share/ca-certificates/russian" ]; then
    XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send -u critical "Russian certificates are installed!"
fi
