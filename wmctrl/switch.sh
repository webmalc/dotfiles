#!/bin/bash
WID=`xprop -root | grep _NET_ACTIVE_WINDOW | head -1 | awk '{print $5}'`
WID="${WID:2}"
ACTIVE_WIN=`wmctrl -lx | grep $WID`
ACTIVE_WIN_CLASS=`echo $ACTIVE_WIN | awk '{print $3}'`
DESTINATION_WIN_CLASS=$1
DESTINATION_APP=$2
HISTORY_FILE=/tmp/windows_history.log

if [[ $ACTIVE_WIN_CLASS == $DESTINATION_WIN_CLASS ]]; then
    PREV_WIN_CLASS=$(tail -1 $HISTORY_FILE)
    PREV_PREV_WIN_CLASS=$(tail -2 $HISTORY_FILE | head -1)

    if [[ $PREV_WIN_CLASS != $ACTIVE_WIN_CLASS ]]; then
        wmctrl -xa  "$PREV_WIN_CLASS"
        echo $PREV_PREV_WIN_CLASS >> $HISTORY_FILE
    elif [[ $PREV_PREV_WIN_CLASS != $ACTIVE_WIN_CLASS ]]; then
        wmctrl -xa  "$PREV_PREV_WIN_CLASS"
        echo $ACTIVE_WIN_CLASS >> $HISTORY_FILE
    fi
else
    touch $HISTORY_FILE
    wmctrl -xa "$DESTINATION_WIN_CLASS" || $DESTINATION_APP & 
    echo $ACTIVE_WIN_CLASS >> $HISTORY_FILE
fi


