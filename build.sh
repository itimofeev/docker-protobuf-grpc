#!/usr/bin/env sh

set -e

PACKAGES="git make autoconf automake libtool unzip"

apt-get update
apt-get install -y $PACKAGES

# Install protoc.
git clone https://github.com/google/protobuf -b $PROTOBUF_TAG --depth 1
cd ./protobuf
./autogen.sh
./configure --prefix=/usr
make -j 3
make check
make install
cd ..
rm -rf ./protobuf


go get -u google.golang.org/grpc \
		  github.com/golang/protobuf/protoc-gen-go \
          github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway \
          github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger

apt-get purge -y $PACKAGES
apt-get clean -y