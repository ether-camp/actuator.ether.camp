#!/bin/bash

echo "SERVER_PORT: $SERVER_PORT"
echo "MANAGE_PASS: $MANAGE_PASS"

./gradlew clean bootRun -Dserver.port=${SERVER_PORT} -Dmanage.pass=${MANAGE_PASS} > out.log &
