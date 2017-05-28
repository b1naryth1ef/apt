#!/bin/bash

build_package() {
  local name=$1
  local version=$2

  # Run the build script, and grab the binary name and version
  rm -rf $name/build/
  mkdir $name/build/
  pushd $name
  local ret="$(VERSION=$version bash build.sh)"
  IFS="|"
  set -- $ret
  local binary_path=$1
  local package_version=$2
  popd

  rm -rf build/
  mkdir -p build/usr/bin/
  mv $name/build/$binary_path build/usr/bin/

  fpm \
    -s dir \
    -t deb \
    -v $package_version \
    -n $name \
    -m "Andrei Zbikowski <b1naryth1ef@gmail.com>" \
    --url "https://github.com/b1naryth1ef/apt" \
    --deb-no-default-config-files \
    build/=/

  rm -rf build/
  rm -rf $name/build/
}

if [ -z "$1" ]; then
  echo "build.sh <package-name> [package-version]"
else
  build_package $1 $2
fi
