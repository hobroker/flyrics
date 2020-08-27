#!/usr/bin/env bash

set -e

PROJECT_PATH=$(pwd)

cd ..
git clone https://github.com/flutter/flutter.git -b dev --depth 1
NEW_PATH="$PATH:$(pwd)/flutter/bin"
echo "::set-env name=PATH::$NEW_PATH"
export PATH="$NEW_PATH"

cd "${PROJECT_PATH}"

flutter pub get
touch .env
