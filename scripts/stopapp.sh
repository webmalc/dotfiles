#!/bin/bash

# Get current hour (00–23 format)
current_hour=$(date +%H)

if [ "$current_hour" -ge 16 ] || [ "$current_hour" -lt 7 ]; then
  pkill -f Telegram
fi
