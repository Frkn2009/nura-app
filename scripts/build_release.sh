#!/usr/bin/env bash
set -e

echo "==> Formatting"
dart format .

echo "==> Analyzing"
flutter analyze

echo "==> Running tests"
flutter test

echo "==> Building AAB"
flutter build appbundle --release

echo "==> Building APK"
flutter build apk --release --no-tree-shake-icons

echo "==> Done"
ls -lh build/app/outputs/flutter-apk/*.apk
ls -lh build/app/outputs/bundle/release/*.aab
