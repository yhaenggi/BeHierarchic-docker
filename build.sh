#!/bin/bash
set -e
export BUILDKIT_PROGRESS=plain

#32bit is currently broken
ARCHES="linux/amd64,linux/arm64"
IMAGE="behierarchic"
cd $HOME/git/BeHierarchic
VERSION=$(git rev-parse HEAD)
cd "$OLDPWD"

sudo --preserve-env=BUILDKIT_PROGRESS docker buildx build --platform "${ARCHES}" -t yhaenggi/${IMAGE}:${VERSION} -t registry.traefik.k8s.darkgamex.ch/${IMAGE}:${VERSION} --build-arg VERSION=${VERSION} --push .
echo registry.traefik.k8s.darkgamex.ch/${IMAGE}:${VERSION} is ready.
