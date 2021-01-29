#!/bin/bash

cd "$(dirname "$0")"

./cleanAndBuildPackagesKZ.sh

cd ../

NETWORK=my-net docker-compose down
NETWORK=my-net docker-compose -f docker-compose-kz.yml up -d --build
