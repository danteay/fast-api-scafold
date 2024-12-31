#!/usr/bin/env bash

TAG_NAME="$2"
APP_NAME="$1"

if [ -z "$APP_NAME" ]; then
    echo "Usage: $0 <app_name> <tag_name>"
    exit 1
fi

if [ -z "$TAG_NAME" ]; then
    echo "Usage: $0 <app_name> <tag_name>"
    exit 1
fi

echo "Creating requirements.txt file..."
poetry export --without-hashes --format=requirements.txt > requirements.txt

echo "Building Docker image..."
docker build -t "$APP_NAME:$TAG_NAME" .