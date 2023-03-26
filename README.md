# docker-snapcast-client

Run a [Snapcast](https://github.com/badaix/snapcast) client as a Docker container.

This is a multi-arch image currently working on the `amd64`, `armhf` and `arm64´ platforms. This means you can use the same image regardless of platform.

## Usage

Run it like this (on your PC or ARM-based device):

```bash
docker run -d --device /dev/snd mazzolino/snapcast-client -h [HOSTNAME OF SERVER]
```

## Building the images

Run the following on your PC in order to run a multi-arch build:

```bash
docker buildx build --platform=linux/arm/v7,linux/arm64,linux/amd64 -t my/image .
```

(Replace `my/image` with your own image name.)

Note: You might need to create a multi-arch builder context on your system beforehand:

```bash
docker buildx create --name multiarch --driver docker-container --use
```
