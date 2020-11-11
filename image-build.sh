#!/bin/sh

. ./image-env.sh

docker build -t $IMAGE_NAME:$IMAGE_VERSION --build-arg FROM_IMAGE="${FROM_IMAGE}"  .

docker build -t $IMAGE_NAME:$IMAGE_VERSION --build-arg FROM_IMAGE="${FROM_IMAGE}"  . && \
    git tag -a $IMAGE_VERSION -m "Version $IMAGE_VERSION" && \
    git commit -a -m "Version $IMAGE_VERSION" && \
    git push origin $IMAGE_VERSION