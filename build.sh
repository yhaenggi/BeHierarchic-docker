#!/bin/bash
set -e
export BUILDKIT_PROGRESS=plain

ARCHES="linux/amd64,linux/arm,linux/arm64"
IMAGE="behierarchic"
VERSION=$(date "+%Y-%m-%d_%H-%M-%S")

sudo docker buildx build --platform "${ARCHES}" -t yhaenggi/${IMAGE}:${VERSION} --build-arg VERSION=${VERSION} --push .
sudo docker buildx build --platform "${ARCHES}" -t registry.traefik.k8s.darkgamex.ch/${IMAGE}:${VERSION} --build-arg VERSION=${VERSION} --push .
