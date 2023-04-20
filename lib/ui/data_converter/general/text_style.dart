import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle grayedOut() {
    return copyWith(
      color: color?.withOpacity(0.6),
    );
  }
}
