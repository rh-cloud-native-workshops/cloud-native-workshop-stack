#!/bin/sh

. ./image-env.sh

git commit -a -m "Version $IMAGE_VERSION" && \
git tag -a $IMAGE_VERSION -m "Version $IMAGE_VERSION" && \
git push origin -f $IMAGE_VERSION
git push origin master