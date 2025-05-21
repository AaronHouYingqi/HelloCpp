#!/bin/bash

ROOT_PATH=$(cd "$(dirname "$0")/.." || exit; pwd)

BUILD_PATH="${ROOT_PATH}/build"
if [ -d "${BUILD_PATH}" ]; then
    rm -r "${BUILD_PATH}"
fi
mkdir -p "${BUILD_PATH}"

cd "${BUILD_PATH}" || exit

cmake -S "${ROOT_PATH}" -B "${BUILD_PATH}" -G "Ninja" -D CMAKE_BUILD_TYPE:STRING=Debug -D CMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -D LEETCODE=ON  # FIXME -D
ninja -C "${BUILD_PATH}"

# TODO cp && rm
