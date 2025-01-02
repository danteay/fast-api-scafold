#!/usr/bin/env bash

TAG_NAME="$2"
APP_NAME="$1"

usage() {
    echo "Usage: $0 <app_name> <tag_name>"
    exit 1
}

if [ -z "$APP_NAME" ]; then
    usage
fi

if [ -z "$TAG_NAME" ]; then
    usage
fi

echo "Creating requirements.txt file..."
uv pip freeze > requirements.txt

echo "Building Docker image..."
docker build -t "$APP_NAME:$TAG_NAME" .