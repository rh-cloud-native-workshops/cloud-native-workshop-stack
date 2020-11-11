#!/bin/sh

. ./image-env.sh

docker tag $IMAGE_NAME:$IMAGE_VERSION $REGISTRY/$REGISTRY_USER_ID/$IMAGE_NAME:$IMAGE_VERSION
docker push $REGISTRY/$REGISTRY_USER_ID/$IMAGE_NAME:$IMAGE_VERSION

git tag -a $IMAGE_VERSION -m "Version $IMAGE_VERSION" && \
git commit -a -m "Version $IMAGE_VERSION" && \
git push origin $IMAGE_VERSION