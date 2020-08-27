#!/usr/bin/env bash

set -e

git clone https://github.com/flutter/flutter.git -b dev --depth 1
NEW_PATH="$PATH:$(pwd)/flutter/bin"
echo "::set-env name=PATH::$NEW_PATH"
export PATH="$NEW_PATH"
flutter config --enable-macos-desktop
flutter pub get
touch .env
