#!/bin/bash

#
# Copyright (C) 2025 KonstaKANG
#
# SPDX-License-Identifier: BSD-3-Clause
#

if [ ! -d "$ANDROID_NDK_HOME" ]; then
  echo "ANDROID_NDK_HOME environment variable is not properly set!"
  exit 1
fi

CMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_HOME/build/cmake/android.toolchain.cmake

ANDROID_ABI=arm64-v8a
ANDROID_TOOLCHAIN=clang
ANDROID_NATIVE_API_LEVEL=35
BUILDTYPE=Debug

mkdir -p build
pushd build

cmake \
-DCMAKE_TOOLCHAIN_FILE=$CMAKE_TOOLCHAIN_FILE \
-DANDROID_ABI=$ANDROID_ABI \
-DANDROID_TOOLCHAIN=$ANDROID_TOOLCHAIN \
-DANDROID_NATIVE_API_LEVEL=$ANDROID_NATIVE_API_LEVEL \
-DCMAKE_BUILD_TYPE=$BUILDTYPE \
../

make -j$(nproc)
make install DESTDIR=./

popd

exit 0
