## List all available commands
default:
  just --list

## Clean environment
clean:
  fvm flutter clean
  fvm flutter pub get

## Run flutter project on iOS simulator
run:
  #!/usr/bin/env zsh
  fvm flutter run -d `just booted-ios-sim-id`

## iOS simulator id
@booted-ios-sim-id:
  just booted-ios-sims | grep -oE "([0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12})"

## Get Booted iOS simulators
@booted-ios-sims:
  just iossims | grep "Booted"

## List iOS simulators
@iossims ARG="available":
  xcrun simctl list devices {{ARG}}

## Run all autogenerator tools
prebuild:
  just pigeon
  just build_runner
  just flutter_icon_launcher

## Run build_runner for code generation
build_runner SUBCOMMAND="build":
  fvm flutter pub run build_runner {{SUBCOMMAND}} --delete-conflicting-outputs

## Run Pigeon for platform-specific code generation
pigeon: 
  fvm flutter pub run pigeon \
  --input pigeons/am_native_api.dart \
  --dart_out lib/api/apple_music/am_native_api.pigeon.dart \
  --objc_header_out ios/Runner/am_native_api.pigeon.h \
  --objc_source_out ios/Runner/am_native_api.pigeon.m \
  --experimental_swift_out ios/Runner/AmNativeApi.pigeon.swift \
# --java_out ./android/app/src/main/java/dev/flutter/pigeon/Pigeon.java \
# --java_package "dev.flutter.pigeon"

## flutter_icon_launcher
flutter_icon_launcher:
  flutter pub run flutter_launcher_icons -f pubspec.yaml