# docker-snapcast-client

Run a [Snapcast](https://github.com/badaix/snapcast) client as a Docker container.

This is a multi-arch image currently working on the `amd64` and `armhf` platforms. This means you can use the same image regardless of platform.

## Usage

Run it like this (on your PC or ARM-based device):

    docker run -d --device /dev/snd mazzolino/snapcast-client -h [HOSTNAME OF SERVER]

## Building the images

* The following lines will build _and push_ your image. Use the `build` make target in order to just build the image locally.
* Replace `my/image` with your own image name.

On your ARM device:

    sudo make IMAGE_NAME=my/image ARCH=armhf

Then, on your PC:

    sudo make IMAGE_NAME=my/image
    make manifest IMAGE_NAME=my/image

Notes:

* Add `SNAPCAST_VERSION=x.xx.x` in order to build a different version of snapcast.
