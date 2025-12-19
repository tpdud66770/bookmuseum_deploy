#!/bin/bash
set -e

APP_DIR=/home/ec2-user/app
LOG_FILE=$APP_DIR/app.log

cd $APP_DIR

JAR_FILE=$(ls -1 *.jar | grep -v plain | head -n 1)

if [ -z "$JAR_FILE" ]; then
  echo "❌ JAR file not found"
  exit 1
fi

echo "▶ Starting $JAR_FILE"

nohup java -jar "$JAR_FILE" > "$LOG_FILE" 2>&1 &
