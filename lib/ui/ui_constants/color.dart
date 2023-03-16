import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../theme_data.dart';

part 'color.g.dart';

@riverpod
class ColorConstants extends _$ColorConstants {
  @override
  ColorConstantsModel build() {
    final colorScheme = ref.watch(appThemeDataProvider).colorScheme;
    return ColorConstantsModel(
      divider: colorScheme.onSurface.withOpacity(0.12),
      subtitle: colorScheme.onSurface.withOpacity(0.6),
    );
  }
}

class ColorConstantsModel {
  final Color divider, subtitle;

  ColorConstantsModel({
    required this.divider,
    required this.subtitle,
  });
}
