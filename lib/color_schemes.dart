import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color_schemes.g.dart';

const Color primarySeedColor = Color.fromARGB(255, 50, 40, 36);

@riverpod
ColorScheme lightColorScheme(LightColorSchemeRef ref) =>
    SeedColorScheme.fromSeeds(
      brightness: Brightness.light,
      primaryKey: primarySeedColor,
      tones: FlexTones.ultraContrast(Brightness.light)
          .onMainsUseBW()
          .onSurfacesUseBW(),
    );

@riverpod
ColorScheme darkColorScheme(DarkColorSchemeRef ref) =>
    SeedColorScheme.fromSeeds(
      brightness: Brightness.dark,
      primaryKey: Colors.black,
      neutralVariantKey: Colors.black,
      // surfaceVariant: Colors.grey,
      tones: FlexTones.ultraContrast(Brightness.dark)
          .onMainsUseBW()
          .onSurfacesUseBW(),
    );
