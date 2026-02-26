#!/bin/sh

# error handling
set -eu

# MZ version to download
MZ_VERSION=1.5.3
ARCHIVE_NAME=libiec61850-${MZ_VERSION}.tar.gz
MZ_URL=https://github.com/mz-automation/libiec61850/archive/refs/tags/v${MZ_VERSION}.tar.gz

# download the MZ-Automation libiec61850 library and extract it
echo "Downloading ${MZ_URL}"
rm -f "${ARCHIVE_NAME}"
curl -fL "${MZ_URL}" -o "${ARCHIVE_NAME}"

tar -xzf "${ARCHIVE_NAME}"

# add the third_party libraries
curl -fL "https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-2.28.10/mbedtls-2.28.10.tar.bz2" \
    -o "mbedtls-2.28.10.tar.bz2"

tar -xjf "mbedtls-2.28.10.tar.bz2"

mv -f ./mbedtls-2.28.10 ./mbedtls-2.28

cp -r mbedtls-2.28 ./libiec61850-1.5.3/third_party/mbedtls/

# Winpcap
curl -fL "https://www.winpcap.org/install/bin/WpdPack_4_1_2.zip" -o "WpdPack_4_1_2.zip"

unzip WpdPack_4_1_2.zip

# copy the lib and include directories to the third_party/winpcap directory
cp -r ./WpdPack/Lib ./libiec61850-1.5.3/third_party/winpcap
cp -r ./WpdPack/Include ./libiec61850-1.5.3/third_party/winpcap

cd libiec61850-1.5.3

make WITH_MBEDTLS=1