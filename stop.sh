#!/bin/bash

PID=$(pgrep -f app.jar || true)

if [ -z "$PID" ]; then
  echo "No process to stop"
  exit 0
fi

echo "Stopping PID: $PID"
kill -15 $PID || true
sleep 3
kill -9 $PID || true

exit 0