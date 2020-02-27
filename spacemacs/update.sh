#!/bin/bash

if cd /home/webmalc/.emacs.d/; git pull --rebase; then
    XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send "Spacemacs has been updated"
else
    XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send --urgency=critical "An error occurred during the Spacemacs update"
fi
