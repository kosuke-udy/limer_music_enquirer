import 'package:flutter/material.dart';

extension ColorConverter on Color {
  Color aptBgColor(BuildContext context) {
    final mode = Theme.of(context).brightness;
    final luminance = computeLuminance();

    if (mode == Brightness.light) {
      if (luminance >= 0.15 || red <= 180) {
        return this;
      } else {
        return _adjustHSV(luminance, 0.15);
      }
    } else {
      const lmnBorder = 0.30;
      if (luminance > lmnBorder) {
        return _adjustHSV(luminance, lmnBorder);
      } else if (red > 125 || blue > 125 || green > 125) {
        return _adjustHSL(0.5);
      } else {
        return this;
      }
    }
  }

  Color _adjustHSV(double current, double targetLuminance) {
    final hsvColor = HSVColor.fromColor(this);
    final luminanceRatio = targetLuminance / current;
    final value = (hsvColor.value * luminanceRatio).clamp(0.0, 1.0);
    final resultHSV = hsvColor.withValue(value);
    return resultHSV.toColor();
  }

  Color _adjustHSL(double amount) {
    HSLColor hslColor = HSLColor.fromColor(this);
    double currentSaturation = hslColor.saturation;
    double newSaturation = currentSaturation - amount;
    newSaturation = newSaturation < 0 ? 0 : newSaturation;
    return hslColor.withSaturation(newSaturation).toColor();
  }
}
