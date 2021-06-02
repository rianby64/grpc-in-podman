
FROM debian:buster as php-grpc

RUN apt update && apt install -y cmake

COPY --from=grpc /grpc /grpc

WORKDIR /grpc/cmake/build

RUN make install

CMD [ "protoc" ]

