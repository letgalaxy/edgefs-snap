#!/bin/sh
set -e

mkdir -p edgefs/opt edgefs/usr/bin
docker run -d --name=edgefs edgefs/edgefs:latest
docker cp edgefs:/opt/nedge edgefs/opt/nedge
docker cp edgefs:/usr/bin/toolbox edgefs/usr/bin/toolbox
docker rm -f edgefs

snapcraft
rm -rf edgefs
