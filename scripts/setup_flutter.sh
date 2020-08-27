#!/usr/bin/env bash

set -e

PROJECT_PATH=$(pwd)

echo "> clone flutter"
cd ..
git clone https://github.com/flutter/flutter.git -b dev --depth 1
NEW_PATH="$PATH:$(pwd)/flutter/bin"
echo "::set-env name=PATH::$NEW_PATH"
export PATH="$NEW_PATH"

cd "${PROJECT_PATH}"

echo "> run pub get"
flutter pub get

echo "> create .env file"
touch .env
