#!/bin/bash

LATEST="0.33.0"
VERSION=${VERSION:-$LATEST}

build() {
  git clone --depth 1 --branch $VERSION https://github.com/ggreer/the_silver_searcher.git build/ag
  pushd build/ag/
  ./build.sh
  popd
}

build > /dev/null

echo "ag/ag|$VERSION"
