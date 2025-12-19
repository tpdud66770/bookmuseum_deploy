#!/bin/bash

for i in {1..20}
do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/actuator/health)

  if [ "$STATUS" = "200" ]; then
    echo "✅ Health check success"
    exit 0
  fi

  echo "⏳ Waiting for server... ($i)"
  sleep 5
done

echo "❌ Health check failed"
exit 1


