#!/bin/bash
function get_proper_title() {
    echo $1 | awk '{print $5}'
}
WID=`xprop -root | grep _NET_ACTIVE_WINDOW | head -1 | awk '{print $5}'`
WID="${WID:2}"
ACTIVE_WIN=`wmctrl -lx | grep $WID`
ACTIVE_WIN_CLASS=`echo $ACTIVE_WIN | awk '{print $3}'`
ACTIVE_WIN_ID=`echo $ACTIVE_WIN | awk '{print $1}'`
ACTIVE_WIN_TITLE=`get_proper_title "$ACTIVE_WIN"`
DESTINATION_WIN_CLASS=$1
DESTINATION_APP=$2
HISTORY_FILE=/tmp/windows_history.log
LOG_FILE=/tmp/windows_log.log
PARAMS=a

# echo "_________________________________________" >> $LOG_FILE

if [[ $DESTINATION_WIN_CLASS == *"."* ]]; then
    PARAMS=xa
else
    ACTIVE_WIN_CLASS=$ACTIVE_WIN_TITLE
fi

# echo "$ACTIVE_WIN_CLASS - $DESTINATION_WIN_CLASS" >> $LOG_FILE

if [[ $ACTIVE_WIN_CLASS == $DESTINATION_WIN_CLASS ]]; then

    PREV_WIN_ID=$(tail -1 $HISTORY_FILE)
    PREV_PREV_WIN_ID=$(tail -2 $HISTORY_FILE | head -1)

    PREV_WIN=`wmctrl -lx | grep $PREV_WIN_ID`
    PREV_WIN_TITLE=`get_proper_title "$PREV_WIN"`

    PREV_PREV_WIN=`wmctrl -lx | grep $PREV_PREV_WIN_ID`
    PREV_PREV_WIN_TITLE=`get_proper_title "$PREV_PREV_WIN"`


    # echo "---- $PREV_WIN_TITLE" >> $LOG_FILE

    if [[ $PREV_WIN_TITLE != $ACTIVE_WIN_TITLE ]]; then
        wmctrl -a  "$PREV_WIN_TITLE"
        echo $ACTIVE_WIN_ID >> $HISTORY_FILE
    elif [[ $PREV_PREV_WIN_TITLE != $ACTIVE_WIN_TITLE ]]; then
        wmctrl -$PARAMS  "$PREV_PREV_WIN_TITLE"
        echo $ACTIVE_WIN_ID >> $HISTORY_FILE
    fi
else
    touch $HISTORY_FILE
    wmctrl -$PARAMS "$DESTINATION_WIN_CLASS" || $DESTINATION_APP & 
    echo $ACTIVE_WIN_ID >> $HISTORY_FILE
fi


