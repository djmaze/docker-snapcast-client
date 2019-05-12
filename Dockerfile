FROM ubuntu AS builder

RUN apt-get update \
 && apt-get -y install build-essential git libasound2-dev libvorbisidec-dev libvorbis-dev libflac-dev alsa-utils libavahi-client-dev avahi-daemon \
 && apt-get clean && rm -fR /var/lib/apt/lists

ARG SNAPCAST_VERSION=0.13.0

RUN cd /tmp \
 && git clone --single-branch --branch v${SNAPCAST_VERSION} https://github.com/badaix/snapcast.git \
 && cd snapcast \
 && git submodule update --init --recursive \
 && make -C client

FROM ubuntu

RUN apt-get update \
 && apt-get -y install libportaudio2 libvorbis0a libavahi-client3 libflac8 libvorbisenc2 libvorbisfile3 libatomic1 \
 && apt-get clean && rm -fR /var/lib/apt/lists

COPY --from=builder /tmp/snapcast/client/snapclient /usr/local/bin/

ENTRYPOINT ["snapclient"]
