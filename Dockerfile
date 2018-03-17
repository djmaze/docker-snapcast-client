FROM ubuntu

RUN apt-get update \
 && apt-get -y install curl libportaudio2 libvorbis0a libavahi-client3 libflac8 libvorbisenc2 libvorbisfile3 libatomic1 \
 && apt-get clean && rm -fR /var/lib/apt/lists

ARG ARCH=amd64
ARG SNAPCAST_VERSION=0.13.0

RUN curl -sL -o /tmp/snapclient.deb https://github.com/badaix/snapcast/releases/download/v${SNAPCAST_VERSION}/snapclient_${SNAPCAST_VERSION}_${ARCH}.deb \
 && dpkg -i /tmp/snapclient.deb \
 && rm /tmp/snapclient.deb

ENTRYPOINT ["snapclient"]
