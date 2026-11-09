#!/usr/bin/env bash
set -euo pipefail

if ! command -v flutter >/dev/null 2>&1; then
  echo "Flutter SDK was not found. Install Flutter and check it with: flutter doctor"
  exit 1
fi

if [ ! -d android ] && [ ! -d web ] && [ ! -d linux ]; then
  flutter create --platforms=android,web,linux --project-name chapter1 .
fi

flutter pub get
flutter run -d chrome
