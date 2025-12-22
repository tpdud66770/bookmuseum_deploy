#!/bin/bash
set -e

APP_DIR=/home/ec2-user/app

echo "🧹 cleaning old files"
rm -f $APP_DIR/*.sh
rm -f $APP_DIR/app.jar