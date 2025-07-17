#!/bin/bash

# Multi-platform Docker build and push script for android-35-node-18
# This script builds the image for both AMD64 and ARM64 platforms

set -e

# Configuration
IMAGE_NAME="vasylnahuliak/android-35-node-18"
TAG="${1:-latest}"
PLATFORMS="linux/amd64,linux/arm64"

echo "Building multi-platform Docker image: $IMAGE_NAME:$TAG"
echo "Platforms: $PLATFORMS"

# Ensure Docker Buildx is available and create a new builder if needed
if ! docker buildx inspect multi-platform-builder >/dev/null 2>&1; then
    echo "Creating multi-platform builder..."
    docker buildx create --name multi-platform-builder --use
else
    echo "Using existing multi-platform builder..."
    docker buildx use multi-platform-builder
fi

# Build and push the multi-platform image
echo "Building and pushing image..."
docker buildx build \
    --platform "$PLATFORMS" \
    --tag "$IMAGE_NAME:$TAG" \
    --tag "$IMAGE_NAME:latest" \
    --push \
    .

echo "Successfully built and pushed $IMAGE_NAME:$TAG for platforms: $PLATFORMS"

# Optional: Show the manifest
echo "Image manifest:"
docker buildx imagetools inspect "$IMAGE_NAME:$TAG" 