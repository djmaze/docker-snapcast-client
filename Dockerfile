FROM alpine:3.17.1

ARG SNAPCAST_VERSION=0.26.0-r3

RUN apk add --no-cache snapcast=${SNAPCAST_VERSION}

ENTRYPOINT ["snapclient"]


