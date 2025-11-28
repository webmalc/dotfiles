#!/bin/sh
XDG_RUNTIME_DIR=/run/user/$(id -u)
APT_UPDATES=0
APT_UPDATES=$(apt list --upgradable 2>/dev/null | grep -c "^[^/]*/")

FLAT_UPDATES=0
FLAT_UPDATES=$((FLAT_USER + FLAT_SYS))

TOTAL=$((APT_UPDATES + FLAT_UPDATES))

if [ "$TOTAL" -gt 0 ]; then
  notify-send "New updates: $TOTAL"
  espeak-ng -p 30 "Human, you have new system updates"
fi
exit 0
