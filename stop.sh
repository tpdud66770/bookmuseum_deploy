#!/bin/bash

PID=$(pgrep -f app.jar)

[ -z "$PID" ] && exit 0

kill -15 $PID
sleep 3
kill -9 $PID 2>/dev/null