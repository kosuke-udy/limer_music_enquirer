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
      ..cardTitle = textTheme.displaySmall!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 14,
      )
      ..cardSubtitle = textTheme.headlineSmall!.copyWith(
        color: colorScheme.onSurface,
        fontSize: 13,
      )
      ..cardBody = textTheme.headlineSmall!.copyWith(
        fontSize: 12,
      )
      ..cardBodySmall = textTheme.headlineSmall!.copyWith(
        fontSize: 10,
      );
  }
}

class TextStyleCommonModel {
  late final TextStyle cardTitle, cardSubtitle;
  late final TextStyle cardBody, cardBodySmall;
}
