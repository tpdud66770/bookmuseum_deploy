#!/bin/bash
set -e

APP_DIR=/home/ec2-user/app
LOG_FILE=$APP_DIR/app.log

cd $APP_DIR

JAR=$(ls -1 *.jar | grep -v plain | head -n 1)

nohup java -jar "$JAR" > "$LOG_FILE" 2>&1 &
