## Display SDK versions of Dart and Flutter
versions:
  @ just --version
  @ echo ""
  @ fvm flutter --version

## Clean environment
clean:
  fvm flutter clean
  fvm flutter pub get

## Install to device
install DEVICE: 
  fvm flutter install -d {{DEVICE}}

## Run all autogenerator tools
@run_autogenerators:
  just pub_pigeon
  fvm flutter pub run slang
  just pub_build_runner build
  fvm flutter pub run flutter_launcher_icons 

## Build
build_all DESTINATION="ios" PROFILE="dev":
  just run_autogenerators
  just build DESTINATION={{DESTINATION}} PROFILE={{PROFILE}}

## Build
build DESTINATION="ios" PROFILE="dev":
  fvm flutter build {{DESTINATION}} --dart-define-from-file=dart_defines/{{PROFILE}}.json

## Run build_runner for code generation
pub_build_runner SUBCOMMAND="build":
  fvm flutter pub run build_runner {{SUBCOMMAND}} --delete-conflicting-outputs

## Run Pigeon for platform-specific code generation
pub_pigeon:
  fvm flutter pub run pigeon \
  --input pigeons/apple_music_native_api.dart \
  --dart_out lib/api/apple_music_api/bridge/apple_music_native_api.pigeon.dart \
  --objc_header_out ios/Runner/AppleMusicNativeApi.pigeon.h \
  --objc_source_out ios/Runner/AppleMusicNativeApi.pigeon.m \
  --experimental_swift_out ios/Runner/AppleMusicNativeApi.pigeon.swift

## flutter_icon_launcher
pub_icons:
  flutter pub run flutter_launcher_icons 

pub_slang:
  fvm flutter pub run slang
  fvm flutter pub run build_runner build --delete-conflicting-outputs

switch-xcode-stable:
  sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
  sudo xcodebuild -runFirstLaunch

switch-xcode-beta:
  sudo xcode-select --switch /Applications/Xcode-beta.app/Contents/Developer
  sudo xcodebuild -runFirstLaunch