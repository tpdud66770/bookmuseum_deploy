#!/bin/bash
set -e

APP_DIR=/home/ec2-user/app
JAR_FILE=$APP_DIR/app.jar
LOG_FILE=$APP_DIR/app.log
PID_FILE=$APP_DIR/app.pid

cd $APP_DIR

echo "▶ Starting application"

# 기존 프로세스가 있으면 종료 (롤링 대비)
if [ -f "$PID_FILE" ]; then
  OLD_PID=$(cat "$PID_FILE")
  if ps -p "$OLD_PID" > /dev/null 2>&1; then
    echo "▶ Stopping existing process (PID: $OLD_PID)"
    kill "$OLD_PID"
    sleep 5
  fi
  rm -f "$PID_FILE"
fi

# 새 프로세스 실행
nohup java -jar "$JAR_FILE" > "$LOG_FILE" 2>&1 &
echo $! > "$PID_FILE"

echo "▶ Application started with PID $(cat "$PID_FILE")"
exit 0

