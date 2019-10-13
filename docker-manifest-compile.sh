
# Reset
rm -fr $HOME/.docker/manifests/

# Create manifest
docker -D manifest create nolim1t/tor:latest nolim1t/tor:latest-armv6 nolim1t/tor:latest-amd64 nolim1t/tor:latest-arm64

# Assign arm6
docker manifest annotate nolim1t/tor:latest nolim1t/tor:latest-armv6 --os linux  --arch arm  --variant v6

# Assign arm64
docker manifest annotate nolim1t/tor:latest nolim1t/tor:latest-arm64 --os linux  --arch arm64  --variant v8

# Push
docker manifest push nolim1t/tor:latest

