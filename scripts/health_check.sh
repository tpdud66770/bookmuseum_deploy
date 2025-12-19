#!/bin/bash

for i in {1..10}
do
  STATUS=$(curl -s http://localhost:8080/actuator/health | grep UP)

  if [ -n "$STATUS" ]; then
    echo "Application is healthy"
    exit 0
  fi

  echo "Waiting for application..."
  sleep 5
done

echo "Application failed health check"
exit 1
