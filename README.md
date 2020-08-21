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


