# Tor Docker Container

This is a docker container for tor based on [this upstream](https://github.com/rdsubhas/docker-tor-privoxy-alpine)

```
docker run -d -p 9050:9050 -p 9051:9051 nolim1t/tor:latest
```


## Other interesting projects

* [docker-tor-privoxy-alpine](https://github.com/rdsubhas/docker-tor-privoxy-alpine) TOR and Privoxy container
* [s6 supervision suite](http://skarnet.org/software/s6/index.html), similar to runit and daemontools
* [s6-overlay](https://github.com/just-containers/s6-overlay), base container with s6 and alpine
* [docker-slim](https://github.com/cloudimmunity/docker-slim), a tool to automatically analyze and trim existing fat containers
