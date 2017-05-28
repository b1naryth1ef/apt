VERSION=0.0.2

wget https://github.com/kelseyhightower/terminus/releases/download/v$VERSION/terminus
mkdir -p build/usr/bin
chmod +x terminus
mv terminus build/usr/bin/terminus

fpm -s dir -t deb -v $VERSION -n terminus -m "Andrei Zbikowski <b1naryth1ef@gmail.com>" --url "https://github.com/b1naryth1ef/apt" build/=/
rm -rf build/
