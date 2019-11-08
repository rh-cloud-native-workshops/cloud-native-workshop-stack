#!/bin/sh

. ./image-env.sh

docker build -t $IMAGE_NAME:$IMAGE_VERSION-$BUILD_NUM --build-arg FROM_IMAGE="${FROM_IMAGE}"  . && \
    git tag -a $IMAGE_VERSION-$BUILD_NUM -m "Version $IMAGE_VERSION-$BUILD_NUM" && \
    git commit -a -m "Version $IMAGE_VERSION-$BUILD_NUM" && \
    git push origin $IMAGE_VERSION-$BUILD_NUM