# Tor as a Docker container


[![Build on push](https://github.com/lncm/docker-tor/workflows/Docker%20build%20on%20push/badge.svg)](https://github.com/lncm/docker-tor/actions?query=workflow%3A%22Docker+build+on+push%22)
[![Build on tag deploy](https://github.com/lncm/docker-tor/workflows/Docker%20build%20on%20tag/badge.svg)](https://github.com/lncm/docker-tor/actions?query=workflow%3A%22Docker+build+on+tag%22)
![Version](https://img.shields.io/github/v/release/lncm/docker-tor?sort=semver) 
![Docker Pulls Count](https://img.shields.io/docker/pulls/lncm/tor.svg?style=flat)

Tor service as a docker container, supporting multiple platforms/architectures (armv6, armv7, arm64, amd64) the LNCM way (inclusive) 

## Usage instructions

## Tags

> **NOTE:** For an always up-to-date list see: https://hub.docker.com/r/lncm/tor/tags

* `latest`
* [`0.4.7.8`](https://hub.docker.com/layers/tor/lncm/tor/0.4.7.8/images/sha256-98269e8123cdeae9dfcb85d9a148d6b59181034de1ba5091d8e26d84af739f28?context=explore)
* [`0.4.7.7`](https://hub.docker.com/layers/tor/lncm/tor/0.4.7.7/images/sha256-35c3e00eb757ed9b1c04ded2245a15ab52ff7bf626b78b07febded4fd8bc435f?context=explore)
* `0.4.6.8`
* `0.4.5.11` 
* [`0.4.7.1-alpha`](https://hub.docker.com/layers/lncm/tor/0.4.7.1-alpha/images/sha256-8fda0d219af1846f2ef6f083c62783bcd1d54b04246c835b561df1238dbe091c?context=explore)
* [`0.4.4.8`](https://hub.docker.com/layers/lncm/tor/0.4.4.8/images/sha256-701ea4a103327422ec560882ce4cf454130bca773a44fbc6d15070118d81f184) [`0.4.5.7`](https://hub.docker.com/layers/lncm/tor/0.4.5.7/images/sha256-5a00971a00143b46e57fd2ce577fe54ed6a5450fa9f463f6876b3616b5dc1dbb)
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
git tag -s 0.4.7.8
```

Would Release ```0.4.7.8``` of tor.

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

## Running

> this assumes `0.4.7.8` version. But you can substitute this for others

### Command Line

To run this from the command line you would need to create an example [config file](https://github.com/torproject/tor/blob/master/src/config/torrc.sample.in) or use the [cut down config file](https://raw.githubusercontent.com/lncm/docker-tor/master/torrc-dist) in this repo.

Then you would need to run:

```bash
docker run --rm -d \
            --network host \
            --name tor \
            -v $PWD/data:/etc/tor \
            -v $PWD/data:/var/lib/tor \
            -v $PWD/run:/var/run/tor \
            lncm/tor:0.4.7.8

```
This assumes you have a directory called `data` and a directory called `run` in the current `$PWD`. And the config file `torrc` should live in data.

### Docker-compose

For your convenience, we have a [docker-compose](https://github.com/lncm/docker-tor/blob/master/docker-compose.yml-dist) file available for you to use too.

By default this uses host networking and requires `data` and `run` folders to be created and with a [valid torrc file](https://github.com/torproject/tor/blob/master/src/config/torrc.sample.in) 

### Generating Tor Passwords

```bash
docker run --rm \
            --name tor \
            lncm/tor:0.4.7.8 \
            --hash-password passwordtogenerate
```

