## List all available commands
default:
  just --list

## Clean environment
clean:
  fvm flutter clean
  fvm flutter pub get

## Install to device
install DEVICE: 
  fvm flutter build ios
  fvm flutter install -d {{DEVICE}}

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
  --input pigeons/apple_music_native_api.dart \
  --dart_out lib/api/apple_music_api/client/bridge/apple_music_native_api.pigeon.dart \
  --objc_header_out ios/Runner/AppleMusicNativeApi.pigeon.h \
  --objc_source_out ios/Runner/AppleMusicNativeApi.pigeon.m \
  --experimental_swift_out ios/Runner/AppleMusicNativeApi.pigeon.swift

## flutter_icon_launcher
icons:
  flutter pub run flutter_launcher_icons 

slang:
  just build_runner build
  fvm flutter pub run slang