#!/bin/bash

echo "Starting to build base images..."

docker build --pull --tag strider2038:php-base ./base/php

echo "Base images created"
