#!/bin/bash

echo "SERVER_PORT: $SERVER_PORT"
echo "MANAGE_PASS: $MANAGE_PASS"

./gradlew clean bootRun -Djava.security.egd=file:/dev/./urandom -Dserver.port=${SERVER_PORT} -Dmanage.pass=${MANAGE_PASS} > out.log &
