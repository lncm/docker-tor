# TOR as a Docker container


[![Build on push](https://github.com/lncm/docker-tor/workflows/Docker%20build%20on%20push/badge.svg)](https://github.com/lncm/docker-tor/actions?query=workflow%3A%22Docker+build+on+push%22)
[![Build on tag deploy](https://github.com/lncm/docker-tor/workflows/Docker%20build%20on%20tag/badge.svg)](https://github.com/lncm/docker-tor/actions?query=workflow%3A%22Docker+build+on+tag%22)
![Version](https://img.shields.io/github/v/release/lncm/docker-tor?sort=semver) 
![Docker Pulls Count](https://img.shields.io/docker/pulls/lncm/tor.svg?style=flat)

TOR service as a docker container, supporting multiple platforms/architectures (armv6, armv7, arm64, amd64) the LNCM way (inclusive) 

## Usage instructions

## Tags

> **NOTE:** For an always up-to-date list see: https://hub.docker.com/r/lncm/tor/tags

* `latest`
* [`0.4.5.6`](https://gitweb.torproject.org/tor.git/plain/ChangeLog?h=tor-0.4.5.6)
* `0.4.4.7`
* `0.4.5.5-rc` `0.4.5.3-rc`
* `0.4.4.5` `0.4.4.6`
* `0.4.4.4-rc` `0.4.3.6` 

## Maintainer release notes

The github action takes in the current tag from  [upstream](https://dist.torproject.org/) and then fetches, verifies and compiles this.

To grab a new version simply just tag a new version

Example:

```bash
git tag -s 0.4.5.6
```

Would Release ```0.4.5.6``` of tor.

As a maintainer, you should also update the documentation too.

### Environment Variables

> **Note** In order to trigger builds This repository uses the following environment variables:

* `DOCKER_HUB_USER` - the username for docker hub
* `DOCKER_USERNAME` - The username for dockerhub.
* `DOCKER_PASSWORD` - The password for dockerhub
* `DOCKER_TOKEN` - the token for docker hub which can push to this projecta (not used currently)
* `GITHUB_TOKEN` - The token of the current user (this is added automatically)
* `GITHUB_ACTOR` - The user to login to docker.pkg.github.com
* `GITHUB_REPOSITORY` - The repository pathname (used for the push to githubs package registry)
* `MAINTAINER_USER` - This is for utilizing the github container registry
* `MAINTAINER_TOKEN` - This is for utilizing the github container registry

## Running

> this assumes `0.4.5.6` version. But you can substitute this for others

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
            lncm/tor:0.4.5.6

```
This assumes you have a directory called `data` and a directory called `run` in the current `$PWD`. And the config file `torrc` should live in data.

### Docker-compose

For your convenience, we have a [docker-compose](https://github.com/lncm/docker-tor/blob/master/docker-compose.yml-dist) file available for you to use too.

By default this uses host networking and requires `data` and `run` folders to be created and with a [valid torrc file](https://github.com/torproject/tor/blob/master/src/config/torrc.sample.in) 

### Generating TOR Passwords

```bash
docker run --rm \
            --name tor \
            lncm/tor:0.4.5.6 \
            --hash-password passwordtogenerate
```

