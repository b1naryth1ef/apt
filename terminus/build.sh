LATEST="0.0.2"
VERSION=${VERSION:-$LATEST}

wget https://github.com/kelseyhightower/terminus/releases/download/v$VERSION/terminus -O build/terminus
chmod +x build/terminus
echo "terminus|$VERSION"
