#!/bin/sh
wmctrl -a terminal || gnome-terminal --hide-menubar --maximize --execute sh -c 'ranger'
