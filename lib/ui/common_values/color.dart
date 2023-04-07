import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme.dart';

part 'color.g.dart';

@riverpod
class ColorCommon extends _$ColorCommon {
  @override
  ColorCommonModel build() {
    final colorScheme = ref.watch(themeDataCommonProvider).colorScheme;
    return ColorCommonModel()
      ..divider = colorScheme.onSurface.withOpacity(0.12)
      ..infoIcon = colorScheme.onSurface.withOpacity(0.6);
  }
}

class ColorCommonModel {
  late final Color divider, infoIcon;
}
