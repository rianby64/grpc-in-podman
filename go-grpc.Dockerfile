
FROM golang:1.16 as go-grpc

RUN apt update && apt install -y cmake

COPY --from=grpc /grpc /grpc

WORKDIR /grpc/cmake/build

RUN make install

RUN GO111MODULE=on \
        go get google.golang.org/protobuf/cmd/protoc-gen-go@v1.26.0 \
        google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1.0

CMD [ "protoc" ]

