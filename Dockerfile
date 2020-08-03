FROM alpine:3.11

ARG USER=toruser
ARG UID=1000

RUN apk add --no-cache tor

RUN adduser \
    --disabled-password \
    --gecos "" \
    --uid "$UID" \
    "$USER"
 
VOLUME /etc/tor/
VOLUME /var/lib/tor/

EXPOSE 9050 9051 29050 29051

ENTRYPOINT ["tor"]
