import 'dart:math';

import 'package:flutter/material.dart';

enum TuningParams {
  resourceCardDark(
    maxSaturation: 0.5,
    minSaturation: 0.00,
    lightness: 0.20,
  ),
  songCardBottomDark(
    maxSaturation: 0.5,
    minSaturation: 0.02,
    lightness: 0.07,
  ),
  songCardTopDark(
    maxSaturation: 0.5,
    minSaturation: 0.00,
    lightness: 0.13,
  );

  final double maxSaturation;
  final double minSaturation;
  final double lightness;

  const TuningParams({
    required this.maxSaturation,
    required this.minSaturation,
    required this.lightness,
  });
}

extension ColorConverter on Color {
  Color tune({
    required TuningParams params,
  }) {
    return adjustHSLDarker(
      maxSaturation: params.maxSaturation,
      minSaturation: params.minSaturation,
      lightness: params.lightness,
    );
  }

  Color adjustHSLDarker({
    required double maxSaturation,
    required double minSaturation,
    required double lightness,
  }) {
    HSLColor hslColor = HSLColor.fromColor(this);

    maxSaturation = min(maxSaturation, 1);
    minSaturation = min(minSaturation, 1);
    if (hslColor.saturation > maxSaturation) {
      hslColor = hslColor.withSaturation(maxSaturation);
    } else if (hslColor.saturation < minSaturation) {
      hslColor = hslColor.withSaturation(minSaturation);
    }

    lightness = min(lightness, 0.9);
    if (hslColor.lightness > lightness) {
      hslColor = hslColor.withLightness(lightness);
    }

    return hslColor.toColor();
  }
}
