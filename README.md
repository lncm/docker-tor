# TOR as a Docker container


[![Build on push](https://github.com/lncm/docker-tor/workflows/Docker%20build%20on%20push/badge.svg)](https://github.com/lncm/docker-tor/actions?query=workflow%3A%22Docker+build+on+push%22)
[![Build on tag deploy](https://github.com/lncm/docker-tor/workflows/Docker%20build%20on%20tag/badge.svg)](https://github.com/lncm/docker-tor/actions?query=workflow%3A%22Docker+build+on+tag%22)
![Version](https://img.shields.io/github/v/release/lncm/docker-tor?sort=semver) 
![Docker Pulls Count](https://img.shields.io/docker/pulls/lncm/tor.svg?style=flat)

TOR service as a docker container

## Usage instructions

## Tags

> **NOTE:** For an always up-to-date list see: https://hub.docker.com/r/lncm/tor/tags

* `latest` `0.4.3.6` `0.4.4.4-rc`

## Maintainer release notes

The github action takes in the current tag from  [upstream](https://dist.torproject.org/) and then fetches, verifies and compiles this.

To grab a new version simply just tag a new version

Example:

```bash
git tag -s 0.4.4.4-rc
```

Would Release ```0.4.4.4-rc``` of tor

## Running

> this assumes `0.4.4.4-rc` version. But you can substitute this for others

### Command Line

To run this from the command line you would need to create an example [config file](https://github.com/torproject/tor/blob/master/src/config/torrc.sample.in)

Then you would need to run:

```bash
docker run --rm -d \
            --network host \
            --name tor \
            -v $PWD/data:/etc/tor \
            -v $PWD/data:/var/lib/tor \
            -v $PWD/run:/var/run/tor \
            lncm/tor:0.4.4.4-rc

```
This assumes you have a directory called `data` and a directory called `run` in the current `$PWD`. And the config file `torrc` should live in data.

### Docker-compose

For your convenience, we have a [docker-compose](https://github.com/lncm/docker-tor/blob/master/docker-compose.yml) file available for you to use too.

By default this uses host networking and requires `data` and `run` folders to be created and with a [valid torrc file](https://github.com/torproject/tor/blob/master/src/config/torrc.sample.in) 

### Generating TOR Passwords

```bash
docker run --rm \
            --name tor \
            lncm/tor:0.4.4.4-rc \
            --hash-password passwordtogenerate
```

