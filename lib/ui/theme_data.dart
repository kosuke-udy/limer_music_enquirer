import 'dart:io';
import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_data.g.dart';

@riverpod
class AppThemeData extends _$AppThemeData {
  @override
  ThemeData build() {
    late final TargetPlatform targetPlatform;
    if (Platform.isIOS) {
      targetPlatform = TargetPlatform.iOS;
    } else {
      throw Exception("Unsupported platform");
    }

    return ThemeData(
      useMaterial3: true,
      colorScheme: _generateColorScheme(
        primarySeedColor: const Color.fromARGB(255, 50, 40, 36),
        brightness: Brightness.dark,
      ),
      platform: targetPlatform,
    );
  }
}

ColorScheme _generateColorScheme({
  required Color primarySeedColor,
  required Brightness brightness,
}) {
  return SeedColorScheme.fromSeeds(
    brightness: Brightness.dark,
    // primaryKey: Colors.black,
    // neutralVariantKey: Colors.black,
    primaryKey: primarySeedColor,
    tones: FlexTones.ultraContrast(Brightness.dark)
        .onMainsUseBW()
        .onSurfacesUseBW(),
  );
}
