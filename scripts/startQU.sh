#!/bin/bash

cd "$(dirname "$0")"

./cleanAndBuildPackagesQU.sh

cd ../

NETWORK=my-net docker-compose down
NETWORK=my-net docker-compose -f docker-compose-qu.yml up -d --build
