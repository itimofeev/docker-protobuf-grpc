FROM golang:1.10.3


ADD . /src
WORKDIR /src

ENV PROTOBUF_TAG v3.6.0

RUN ./build.sh

ENTRYPOINT ["protoc"]
