#!/bin/bash
set -e

APP_DIR=/home/ec2-user/app
LOG_FILE=$APP_DIR/app.log
JAR_FILE=$APP_DIR/app.jar

cd $APP_DIR

echo "▶ Starting app.jar"
nohup java -jar "$JAR_FILE" > "$LOG_FILE" 2>&1 &



