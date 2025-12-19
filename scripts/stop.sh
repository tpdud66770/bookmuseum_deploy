#!/bin/bash

PID=$(lsof -ti tcp:8080)

if [ -z "$PID" ]; then
  echo "ℹ️ No process using port 8080"
  exit 0
fi

echo "⏹ Stopping process on port 8080: $PID"
kill -15 $PID

sleep 5

PID2=$(lsof -ti tcp:8080)
if [ -n "$PID2" ]; then
  echo "⚠️ Force killing process on port 8080: $PID2"
  kill -9 $PID2
fi

exit 0



