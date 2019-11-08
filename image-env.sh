#!/bin/sh

export BUILD_NUM=3
export REGISTRY=quay.io
export REGISTRY_USER_ID=cvicensa
export IMAGE_NAME=cnw-che-stack
export IMAGE_VERSION=7.3.1
export FROM_IMAGE=quay.io/eclipse/che-java11-maven:${IMAGE_VERSION}
