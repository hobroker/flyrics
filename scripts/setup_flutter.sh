#!/usr/bin/env bash

set -e

# save project source path
PROJECT_PATH=$(pwd)

# cd outside of the project source
cd ..

git clone https://github.com/flutter/flutter.git -b dev --depth 1

# export flutter bin PATH
NEW_PATH="$PATH:$(pwd)/flutter/bin"
echo "::set-env name=PATH::$NEW_PATH" # for next github action steps
export PATH="$NEW_PATH" # for next commands in this file

# cd in the project source
cd "${PROJECT_PATH}"

# run pub get
flutter pub get

# create .env file
touch .env
