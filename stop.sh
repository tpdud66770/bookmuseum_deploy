#!/bin/bash
set -e

APP_DIR=/home/ec2-user/app

echo "🧹 cleaning old app"
pkill -f app.jar || true
rm -f $APP_DIR/app.jar
