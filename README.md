# TOR as a Docker container

[![Build on deploy](https://github.com/lncm/tor/workflows/Docker%20build%20on%20tag/badge.svg)](https://github.com/lncm/tor/actions?query=workflow%3A%22Docker+build+on+tag%22)
![Version](https://img.shields.io/github/v/release/lncm/tor?sort=semver) 
![Docker Pulls Count](https://img.shields.io/docker/pulls/lncm/tor.svg?style=flat)

TOR service as a docker container

## Usage instructions

### Docker pull

```bash
docker pull lncm/tor:0.4.3.6
```

## Maintainer release notes

The github action takes in the current tag from  [upstream](https://dist.torproject.org/) and then fetches, verifies and compiles this.

To grab a new version simply just tag a new version

Example:

```bash
git tag -s 0.4.4.4-rc
```

Would Release ```0.4.4.4-rc``` of tor


