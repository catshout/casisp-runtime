#!/bin/bash
if [ "$1" ]; then
  curl --insecure --data @$1 --request POST 'https://localhost:8443/casisp/deploy/api' --header 'Content-Type: application/json' -u admin:passw0rd
else
  echo usage: ./deploy-api.sh filename
fi
