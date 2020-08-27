#!/usr/bin/env bash

set -e

git clone https://github.com/flutter/flutter.git -b dev --depth 1
echo "::set-env name=PATH::$PATH:$(pwd)/flutter/bin"
export PATH="$PATH:$(pwd)/flutter/bin"
flutter config --enable-macos-desktop
flutter pub get
touch .env
