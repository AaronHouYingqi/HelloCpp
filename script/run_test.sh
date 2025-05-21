#!/bin/bash

ROOT_PATH=$(cd "$(dirname "$0")/.." || exit; pwd)
BUILD_PATH="${ROOT_PATH}/build"
cd "${BUILD_PATH}" || exit

./test/test
