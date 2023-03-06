#!/bin/bash -e

REGISTRY=${REGISTRY:-esw123}
BUILD_DATE=$(printf '%(%Y-%m-%d)T' -1)
BUILD_TAG=${BUILD_TAG:-${BUILD_DATE}}

DOCKER_BUILDKIT=1 \
 docker build -t "${REGISTRY}/qmcpack-ci:${BUILD_TAG}" .
