#!/bin/bash
set -e

APP_DIR=/home/ec2-user/app
LOG_FILE=$APP_DIR/app.log

cd $APP_DIR

# ✅ Permission denied 방지 (필수)
touch "$LOG_FILE"
chown ec2-user:ec2-user "$LOG_FILE"
chmod 664 "$LOG_FILE"

JAR_FILE=$(ls -1 *.jar | head -n 1)

if [ -z "$JAR_FILE" ]; then
  echo "❌ JAR not found in $APP_DIR" >> "$LOG_FILE"
  exit 1
fi

echo "▶ Starting $JAR_FILE" >> "$LOG_FILE"

# ✅ 덮어쓰기(>) 대신 append(>>) 권장
nohup java -jar "$JAR_FILE" >> "$LOG_FILE" 2>&1 &
