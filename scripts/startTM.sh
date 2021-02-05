#!/bin/bash

cd "$(dirname "$0")"

./cleanAndBuildPackages.sh

cd ../

NETWORK=my-net docker-compose down
NETWORK=my-net docker-compose -f docker-compose-tm.yml up -d --build
