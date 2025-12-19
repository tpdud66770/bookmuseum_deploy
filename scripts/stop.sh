#!/bin/bash

PID=$(pgrep -f ".jar")

if [ -z "$PID" ]; then
  echo "ℹ️ No running process found"
  exit 0
fi

echo "⏹ Stopping process $PID"
kill -15 $PID

sleep 5

if ps -p $PID > /dev/null; then
  echo "⚠️ Force kill $PID"
  kill -9 $PID
fi


