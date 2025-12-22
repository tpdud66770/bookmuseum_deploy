#!/bin/bash
set -e

APP_DIR=/home/ec2-user/app
JAR_FILE=$APP_DIR/app.jar

PID=$(pgrep -f app.jar || true)

if [ -n "$PID" ]; then
  echo "Stopping PID: $PID"
  kill -15 $PID || true
  sleep 3
  kill -9 $PID || true
else
  echo "No process to stop"
fi

echo "Removing old app.jar"
rm -f "$JAR_FILE"

exit 0
