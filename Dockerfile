ARG VERSION=0.4.3.6

ARG USER=toruser
ARG UID=1000

ARG DIR=/data

ARG SOURCE=release

FROM debian:buster-slim as preparer-base

RUN apt update
RUN apt -y install gnupg

# Add tor key
ENV KEYS 7A02B3521DC75C542BA015456AFEE6D49E92B601

RUN gpg  --keyserver keyserver.ubuntu.com  --recv-keys $KEYS

RUN gpg --list-keys | tail -n +3 | tee /tmp/keys.txt && \
    gpg --list-keys $KEYS | diff - /tmp/keys.txt

FROM preparer-base AS preparer-release

ARG VERSION

ADD https://dist.torproject.org/tor-$VERSION.tar.gz.asc ./
ADD https://dist.torproject.org/tor-$VERSION.tar.gz ./

RUN gpg --verify tor-$VERSION.tar.gz.asc

# Extract
RUN tar -xzf "/tor-$VERSION.tar.gz" && \
    rm  -f   "/tor-$VERSION.tar.gz"

FROM preparer-${SOURCE} AS preparer

FROM debian:buster-slim as builder

ARG VERSION

RUN apt -y install libevent-dev libssl-dev zlib1g-dev build-essential

WORKDIR /tor-$VERSION/

COPY  --from=preparer /tor-$VERSION/  ./

RUN ./configure
