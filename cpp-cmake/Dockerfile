FROM gcc:9 as builder

LABEL maintainer="hazem.ataya94@gmail.com"

COPY . /app

WORKDIR /app/build

RUN apt-get update \
    && apt-get -y install cmake

RUN cmake ../ && make

#final image, without source code, only executable
FROM debian:stretch

COPY --from=builder /app/build/hello_world /app/hello_world

WORKDIR /app

RUN useradd -m -d /home/cpp-user cpp-user \
    && chown -R cpp-user:cpp-user /app

USER cpp-user

ENTRYPOINT ["./hello_world"]
