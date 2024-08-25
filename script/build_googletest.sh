#!/bin/bash

ROOT_PATH=$(cd "$(dirname "$0")/.." || exit; pwd)
cd "${ROOT_PATH}" || exit

SOURCE_PATH="./external/GoogleTest"
git submodule update --init --recursive "${SOURCE_PATH}"

BINARY_PATH="./.GoogleTest"
if [ -d "${BINARY_PATH}" ]; then
    rm -r "${BINARY_PATH}"
fi

cmake -S "${SOURCE_PATH}" -B "${BINARY_PATH}" -G "Ninja"  # -G "MinGW Makefiles"
ninja -C "${BINARY_PATH}"

DEPENDENCE_PATH="./dependence/GoogleTest"
if [ -d "${DEPENDENCE_PATH}" ]; then
    rm -r "${DEPENDENCE_PATH}"
fi

mkdir -p "${DEPENDENCE_PATH}"/include
cp -r "${SOURCE_PATH}"/googletest/include/gtest "${DEPENDENCE_PATH}/include"
cp -r "${SOURCE_PATH}"/googlemock/include/gmock "${DEPENDENCE_PATH}/include"
cp -r "${BINARY_PATH}"/lib "${DEPENDENCE_PATH}"

rm -r "${BINARY_PATH}"
