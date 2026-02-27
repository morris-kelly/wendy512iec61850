#!/bin/bash

# error handling
set -eu

# MZ version to download
MZ_VERSION=1.5


# download the MZ-Automation libiec61850 library and extract it
echo "Downloading libiec61850 version ${MZ_VERSION} from MZ-Automation..."
git clone -b v${MZ_VERSION} https://github.com/mz-automation/libiec61850.git ./libiec61850-${MZ_VERSION}

# add the third_party libraries
echo "Downloading third party libraries..."

echo "Downloading mbedtls version 2.28.10..."
git clone -b v2.28.10 https://github.com/Mbed-TLS/mbedtls.git ./libiec61850-${MZ_VERSION}/third_party/mbedtls/mbedtls-2.28

# Winpcap
echo "Downloading Winpcap version 4.1.2..."
curl -fL "https://www.winpcap.org/install/bin/WpdPack_4_1_2.zip" -o "WpdPack_4_1_2.zip"

unzip WpdPack_4_1_2.zip

# copy the lib and include directories to the third_party/winpcap directory
cp -r ./WpdPack/Lib ./libiec61850-${MZ_VERSION}/third_party/winpcap
cp -r ./WpdPack/Include ./libiec61850-${MZ_VERSION}/third_party/winpcap

cd libiec61850-${MZ_VERSION}

mkdir -p /build
make WITH_MBEDTLS=1 INSTALL_PREFIX=/build install