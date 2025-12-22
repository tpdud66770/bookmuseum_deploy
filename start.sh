#!/bin/bash

APP_DIR="/home/ec2-user/app"
APP_NAME="app.jar"

echo "Starting application..."

nohup java -jar "$APP_DIR/$APP_NAME" > "$APP_DIR/app.log" 2>&1 &

exit 0
