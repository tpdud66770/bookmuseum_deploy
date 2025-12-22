#!/bin/bash

APP_NAME="app.jar"
APP_DIR="/home/ec2-user/app"
APP_PATH="$APP_DIR/$APP_NAME"

echo "===== ApplicationStop started ====="

# 1. 실행 중인 애플리케이션 종료
PID=$(pgrep -f "$APP_NAME" || true)

if [ -n "$PID" ]; then
  echo "Stopping application. PID: $PID"
  kill -15 $PID || true
  sleep 5
  kill -9 $PID || true
else
  echo "No running application found"
fi

# 2. 기존 jar 파일 삭제 (🔥 핵심)
if [ -f "$APP_PATH" ]; then
  echo "Removing existing jar file: $APP_PATH"
  rm -f "$APP_PATH"
else
  echo "No existing jar file to remove"
fi

echo "===== ApplicationStop completed ====="
exit 0
