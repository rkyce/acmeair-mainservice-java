#!/bin/bash

cd "$(dirname "$0")"

./cleanAndBuildPackagesTH.sh

cd ../

NETWORK=my-net docker-compose down
NETWORK=my-net docker-compose -f docker-compose-th.yml up -d --build
