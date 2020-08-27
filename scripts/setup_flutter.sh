#!/usr/bin/env bash

set -e

pwd
exit 1;
export_path() {
  NEW_PATH="$PATH:$(pwd)/flutter/bin"
  echo "::set-env name=PATH::$NEW_PATH"
  export PATH="$NEW_PATH"
}

git clone https://github.com/flutter/flutter.git -b dev --depth 1
export_path
flutter pub get
touch .env
