#!/bin/bash

LATEST="2.5"
VERSION=${VERSION:-$LATEST}

build() {
  git clone --depth 1 --branch $VERSION https://github.com/tmux/tmux.git build/tmux/
  pushd build/tmux/
  ./autogen.sh
  ./configure
  make -j
  popd
}

build > /dev/null

echo "tmux/tmux|$VERSION"
