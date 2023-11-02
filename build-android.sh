#!/bin/bash

#
# Copyright (C) 2023 KonstaKANG
#
# SPDX-License-Identifier: BSD-3-Clause
#

[ -d "$ANDROID_NDK_HOME" ] || { echo "Set ANDROID_NDK_HOME environment variable!"; exit 1; }
CMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_HOME/build/cmake/android.toolchain.cmake

ANDROID_ABI=arm64-v8a
ANDROID_TOOLCHAIN=clang
ANDROID_NATIVE_API_LEVEL=34
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
