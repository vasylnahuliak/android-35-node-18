# Makefile for android-35-node-18 Docker image

.PHONY: help build push release test clean

# Default target
help:
	@echo "Available commands:"
	@echo "  make build    - Build the Docker image locally"
	@echo "  make push     - Build and push multi-platform image"
	@echo "  make release  - Quick release with timestamp tag"
	@echo "  make test     - Test the image locally"
	@echo "  make clean    - Clean up local images"

# Configuration
IMAGE_NAME = vasylnahuliak/android-35-node-18
TAG = latest
PLATFORMS = linux/amd64,linux/arm64

# Build locally (single platform)
build:
	docker build -t $(IMAGE_NAME):$(TAG) .

# Build and push multi-platform image
push:
	docker buildx build \
		--platform $(PLATFORMS) \
		--tag $(IMAGE_NAME):$(TAG) \
		--tag $(IMAGE_NAME):latest \
		--push \
		.

# Quick release with timestamp
release:
	@./release.sh

# Test the image locally
test:
	docker run --rm $(IMAGE_NAME):$(TAG) node --version
	docker run --rm $(IMAGE_NAME):$(TAG) java -version
	docker run --rm $(IMAGE_NAME):$(TAG) sdkmanager --list | head -10

# Clean up local images
clean:
	docker rmi $(IMAGE_NAME):$(TAG) 2>/dev/null || true
	docker rmi $(IMAGE_NAME):latest 2>/dev/null || true 