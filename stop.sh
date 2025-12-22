#!/bin/bash
set -e

APP_DIR=/home/ec2-user/app
JAR_NAME=app.jar

PID=$(pgrep -f "$JAR_NAME" || true)

if [ -n "$PID" ]; then
  echo "▶ Stopping app (PID: $PID)"
  kill -15 $PID || true
  sleep 5
fi

exit 0