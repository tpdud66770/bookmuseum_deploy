#!/bin/bash

for i in {1..20}
do
  CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/actuator/health || true)

  if [ "$CODE" = "200" ]; then
    echo "Application is healthy"
    exit 0
  fi

  echo "Waiting for application..."
  sleep 5
done

echo "Application failed health check"
exit 1

