FROM alpine:latest AS alpine

RUN apk add --no-cache \
    git \
    build-base \
    ca-certificates \
    cmake \
    autoconf \
    automake \
    libtool \
    pkgconfig \
    curl \
    linux-headers

WORKDIR /app

COPY build.sh .

CMD ["sh", "build.sh"]