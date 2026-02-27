FROM alpine:latest AS alpine

RUN apk add --no-cache build-base linux-headers

WORKDIR /app

COPY libiec61850-repo /app/libiec61850-repo

WORKDIR /app/libiec61850-repo

# set up the debian image the same way
FROM debian:trixie AS debian

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential

WORKDIR /app

COPY libiec61850-repo /app/libiec61850-repo

WORKDIR /app/libiec61850-repo
