#!/bin/bash
set -eu

./gradlew

if [ $# -ne 0 ] && [ "$1" == "test-harness" ]
  then
    echo "Running using the test harness to stub STS tokens"
    ONE_LOGIN_AUTH_SERVER_URL=http://localhost:3001 ./gradlew run
  else
    echo "Running using the stub credential issuer to stub STS tokens"
    ./gradlew run
fi