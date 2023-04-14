import 'dart:math';

import 'package:flutter/material.dart';

extension ColorConverter on Color {
  static const _baseMaxSaturation = 0.3;
  static const _baseMinSaturation = 0.2;
  static const _baseMaxLightness = 0.10;
  static const _baseMinLightness = 0.05;

  Color aptCardBgColor({double lightnessAddition = 0}) {
    return adjustHSLDarker(
      maxSaturation: _baseMaxSaturation,
      minSaturation: _baseMinSaturation,
      maxLightness: _baseMaxLightness + lightnessAddition,
      minLightness: _baseMinLightness + lightnessAddition,
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
