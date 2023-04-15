import 'dart:math';

import 'package:flutter/material.dart';

enum TuningParams {
  dark(
    maxSaturation: 0.3,
    minSaturation: 0.00,
    maxLightness: 0.09,
    minLightness: 0.02,
  ),
  darkAccent(
    maxSaturation: 0.4,
    minSaturation: 0.00,
    maxLightness: 0.15,
    minLightness: 0.10,
  );

  final double maxSaturation;
  final double minSaturation;
  final double maxLightness;
  final double minLightness;

  const TuningParams({
    required this.maxSaturation,
    required this.minSaturation,
    required this.maxLightness,
    required this.minLightness,
  });
}

extension ColorConverter on Color {
  Color tune({
    required TuningParams params,
  }) {
    return adjustHSLDarker(
      maxSaturation: params.maxSaturation,
      minSaturation: params.minSaturation,
      maxLightness: params.maxLightness,
      minLightness: params.minLightness,
    );
  }

  Color adjustHSLDarker({
    required double maxSaturation,
    required double minSaturation,
    required double maxLightness,
    required double minLightness,
  }) {
    HSLColor hslColor = HSLColor.fromColor(this);

    maxSaturation = min(maxSaturation, 1);
    minSaturation = min(minSaturation, 1);
    if (hslColor.saturation > maxSaturation) {
      hslColor = hslColor.withSaturation(maxSaturation);
    } else if (hslColor.saturation < minSaturation) {
      hslColor = hslColor.withSaturation(minSaturation);
    }

    maxLightness = min(maxLightness, 0.9);
    minLightness = min(minLightness, 0.9);
    if (hslColor.lightness > maxLightness) {
      hslColor = hslColor.withLightness(maxLightness);
    } else if (hslColor.lightness < minLightness) {
      hslColor = hslColor.withLightness(minLightness);
    }

    return hslColor.toColor();
  }
}
