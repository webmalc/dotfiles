#!/bin/sh
XDG_RUNTIME_DIR=/run/user/$(id -u)
APT_UPDATES=0
APT_UPDATES=$(apt list --upgradable 2>/dev/null | grep -c "^[^/]*/")

FLAT_UPDATES=0
FLAT_UPDATES=$(flatpak remote-ls --updates | wc -l)

TOTAL=$((APT_UPDATES + FLAT_UPDATES))

if [ "$TOTAL" -gt 0 ]; then
  notify-send "New updates: $TOTAL"
  espeak-ng -p 30 "You have new system updates"
fi
exit 0
