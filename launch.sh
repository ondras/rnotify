#!/bin/sh

DIR=`dirname $_`
FILE="$HOME/.dbus_settings"
need_start=1

if [ -r "$FILE" ]; then
    . $FILE
fi

if [ -n "$DBUS_SESSION_BUS_PID" ]; then
    if kill -0 "$DBUS_SESSION_BUS_PID" 2>/dev/null; then
        need_start=0  # dbus already runnig
    fi
fi

if [ "$need_start" -ne 0 ]; then
    dbus-launch --sh-syntax > "$FILE"
    . $FILE
fi


$DIR/rnotifyd &
