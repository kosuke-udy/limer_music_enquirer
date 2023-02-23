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

## Run build_runner for code generation
build_runner COMMAND="build":
  if [[ {{COMMAND}} == "build"]] 