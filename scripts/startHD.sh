#!/bin/bash

cd "$(dirname "$0")"
cd ../

mvn clean package

NETWORK=my-net docker-compose down
NETWORK=my-net docker-compose -f docker-compose-hd.yml up -d --build
