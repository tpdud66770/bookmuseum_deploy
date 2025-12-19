#!/bin/bash

for i in {1..60}
do
  RESPONSE=$(curl -s -w "\n%{http_code}" http://localhost:8080/actuator/health)
  BODY=$(echo "$RESPONSE" | head -n 1)
  CODE=$(echo "$RESPONSE" | tail -n 1)

  if [ "$CODE" = "200" ] && echo "$BODY" | grep -q '"status":"UP"'; then
     echo "Application is healthy"
    exit 0
  fi

  echo "Waiting for application..."
  sleep 5
done

echo "Application failed health check"
exit 1
