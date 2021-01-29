#!/bin/bash

cd "$(dirname "$0")"

./cleanAndBuildPackages.sh

cd ../

NETWORK=my-net docker-compose down
NETWORK=my-net docker-compose -f docker-compose-wf.yml up -d --build
