# Android 35 + Node 18 Docker Image

Multi-platform Docker image with Android SDK 35, Node.js 18, and development tools.

## Quick Start

### For every release (recommended):
```bash
./release.sh
```

This will:
- Build for both AMD64 and ARM64 platforms
- Tag with timestamp and latest
- Push to Docker Hub

### Alternative commands:

**Build and push multi-platform image:**
```bash
make push
```

**Quick release with custom tag:**
```bash
./release.sh v1.0.0
```

**Build locally (single platform):**
```bash
make build
```

**Test the image:**
```bash
make test
```

## What's Included

- Ubuntu Focal (20.04)
- OpenJDK 17
- Node.js 18
- Android SDK 35
- Android Build Tools 35.0.0
- Android NDK 27.1.12297006
- Ruby with Bundler
- Development tools (git, curl, etc.)

## Environment Variables

- `ANDROID_SDK_ROOT=/opt/android-sdk-linux`
- `ANDROID_HOME=/opt/android-sdk-linux`
- `ANDROID_NDK_ROOT=/opt/android-sdk-linux/ndk/27.1.12297006`
- `ANDROID_NDK_HOME=/opt/android-sdk-linux/ndk/27.1.12297006`

## Usage

```bash
docker run --rm vasylnahuliak/android-35-node-18:latest node --version
docker run --rm vasylnahuliak/android-35-node-18:latest java -version
```

## Troubleshooting

If you encounter platform compatibility issues:
1. Ensure you're using the latest multi-platform image
2. Run `./release.sh` to rebuild and push the image
3. Check the image manifest: `docker buildx imagetools inspect vasylnahuliak/android-35-node-18:latest` 