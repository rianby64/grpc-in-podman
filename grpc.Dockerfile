
FROM debian:buster as grpc

RUN apt update

RUN apt install -y git build-essential autoconf libtool pkg-config cmake

RUN git clone --recurse-submodules -b v1.38.0 https://github.com/grpc/grpc /grpc

WORKDIR /grpc/cmake/build

RUN cmake -j 8 -DBUILD_SHARED_LIBS=ON ../..

RUN make -j 8

RUN make install

RUN rm -rf $(find /grpc | grep ".git$")

CMD [ "protoc" ]

