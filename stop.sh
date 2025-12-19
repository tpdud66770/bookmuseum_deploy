#!/bin/bash
APP_DIR=/home/ec2-user/app
JAR_NAME=$(ls -1 $APP_DIR/*.jar 2>/dev/null | head -n 1)

if [ -z "$JAR_NAME" ]; then
  echo "no jar"
  exit 0
fi

PID=$(pgrep -f "$JAR_NAME" || true)

if [ -z "$PID" ]; then
  echo "ℹ️ No running process found"
  exit 0
fi

echo "⏹ Stopping $PID ($JAR_NAME)"
kill -15 $PID
sleep 5
ps -p $PID >/dev/null && kill -9 $PID


