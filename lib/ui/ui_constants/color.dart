import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme.dart';

part 'color.g.dart';

@riverpod
class ColorConstants extends _$ColorConstants {
  @override
  ColorConstantsModel build() {
    final colorScheme = ref.watch(themeDataConstantsProvider).colorScheme;
    return ColorConstantsModel()
      ..divider = colorScheme.onSurface.withOpacity(0.12)
      ..infoIcon = colorScheme.onSurface.withOpacity(0.6);
  }
}

class ColorConstantsModel {
  late final Color divider, infoIcon;
}
