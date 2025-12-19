#!/bin/bash
set -e

APP_DIR=/home/ec2-user/app
LOG_FILE=$APP_DIR/app.log

cd $APP_DIR

touch "$LOG_FILE"
chmod 644 "$LOG_FILE"

JAR_FILE=$(ls -1 build/libs/*.jar | head -n 1)

if [ -z "$JAR_FILE" ]; then
  echo "❌ JAR not found in build/libs" >> "$LOG_FILE"
  exit 1
fi

echo "▶ Starting $JAR_FILE" >> "$LOG_FILE"
nohup java -jar "$JAR_FILE" >> "$LOG_FILE" 2>&1 &



