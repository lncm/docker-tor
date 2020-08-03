ARG VERSION=0.4.3.6

ARG USER=toruser
ARG UID=1000

ARG DIR=/data

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

FROM preparer-release AS preparer

FROM debian:buster-slim as builder

ARG VERSION

RUN apt update
RUN apt -y install libevent-dev libssl-dev zlib1g-dev build-essential

WORKDIR /tor-$VERSION/

COPY  --from=preparer /tor-$VERSION/  ./

RUN ./configure --sysconfdir=/etc/tor
RUN make
RUN make install

FROM debian:buster-slim as final

ARG VERSION
ARG USER
ARG DIR

LABEL maintainer="nolim1t (@nolim1t)"

COPY  --from=builder /usr/lib /usr/lib
# Copy all the TOR files
COPY  --from=builder /usr/local/bin/tor*  /usr/local/bin/
COPY  --from=builder /usr/local/share/tor /usr/local/share/tor
COPY  --from=builder /usr/local/share/man/man1 /usr/local/share/man/man1
COPY  --from=builder /etc/tor  /etc/tor

# NOTE: Default GID == UID == 1000
RUN adduser --disabled-password \
            --home "$DIR/" \
            --gecos "" \
            "$USER"
USER $USER

VOLUME /etc/tor
VOLUME /var/lib/tor

EXPOSE 9050 9051 29050 29051

ENTRYPOINT ["tor"]
