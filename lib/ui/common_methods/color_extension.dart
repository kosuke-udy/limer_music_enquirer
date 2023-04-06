import 'package:flutter/material.dart';

extension ColorConverter on Color {
  Color aptCardBgFront() {
    return _adjustHSLDarker(
      saturation: 0.4,
      lightness: 0.3,
    );
  }

  Color aptCardBgBack() {
    return _adjustHSLDarker(
      saturation: 0.3,
      lightness: 0.15,
    );
  }

  Color _adjustHSLDarker({
    required double saturation,
    required double lightness,
  }) {
    HSLColor hslColor = HSLColor.fromColor(this);

    if (hslColor.lightness > lightness) {
      hslColor = hslColor.withLightness(lightness);
    }

    if (hslColor.saturation > saturation) {
      hslColor = hslColor.withSaturation(saturation);
    }

    return hslColor.toColor();
  }
}
