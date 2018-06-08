#!/bin/bash

DEPS="git g++ build-essential qt5-qmake qt5-default qttools5-dev-tools"
LATEST="master"
VERSION=${VERSION:-$LATEST}

build() {
  sudo apt install $DEPS
  git clone --depth 1 --branch $VERSION https://github.com/lupoDharkael/flameshot.git build/flameshot
  pushd build/flameshot/
  qmake && make -j
  popd
}

build > /dev/null

echo "flameshot/flameshot|$VERSION"
