FROM golang:1.10.3


ADD . /src
WORKDIR /src

ENV PROTOBUF_TAG v3.5.1

RUN ./build.sh

ENTRYPOINT ["protoc"]
