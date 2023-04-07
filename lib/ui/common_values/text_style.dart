import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme.dart';

part 'text_style.g.dart';

@riverpod
class TextStyleCommon extends _$TextStyleCommon {
  @override
  TextStyleCommonModel build() {
    final textTheme = ref.watch(themeDataCommonProvider).textTheme;
    final colorScheme = ref.watch(themeDataCommonProvider).colorScheme;

    return TextStyleCommonModel()
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

class TextStyleCommonModel {
  late final TextStyle title;
  late final TextStyle subtitle, subtitleGray;
}
