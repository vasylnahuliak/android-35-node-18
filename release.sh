#!/bin/bash

# Quick release script for android-35-node-18
# Usage: ./release.sh [tag]

set -e

IMAGE_NAME="vasylnahuliak/android-35-node-18"
TAG="${1:-$(date +%Y%m%d-%H%M%S)}"

echo "🚀 Releasing $IMAGE_NAME:$TAG"

# Build and push multi-platform image
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --tag "$IMAGE_NAME:$TAG" \
    --tag "$IMAGE_NAME:latest" \
    --push \
    .

echo "✅ Successfully released $IMAGE_NAME:$TAG"
echo "📋 Available tags: $TAG, latest" 