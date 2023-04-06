import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme.dart';

part 'text_style.g.dart';

@riverpod
class TextStyleConstants extends _$TextStyleConstants {
  @override
  TextStyleConstantsModel build() {
    final textTheme = ref.watch(themeDataConstantsProvider).textTheme;
    final colorScheme = ref.watch(themeDataConstantsProvider).colorScheme;

    return TextStyleConstantsModel()
      ..title = textTheme.displaySmall!.copyWith(
        fontWeight: FontWeight.w600,
      )
      ..subtitle = textTheme.headlineSmall!.copyWith(
        color: colorScheme.onSurface,
      )
      ..subtitleGray = textTheme.headlineSmall!.copyWith(
        color: colorScheme.onSurface.withOpacity(0.6),
      );
  }
}

class TextStyleConstantsModel {
  late final TextStyle title;
  late final TextStyle subtitle, subtitleGray;
}
