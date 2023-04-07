import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'animation.dart';
import 'color.dart';
import 'opacity.dart';
import 'radius.dart';
import 'size.dart';
import 'text_style.dart';
import 'theme.dart';

part 'common_values.g.dart';

@riverpod
class CommonValues extends _$CommonValues {
  @override
  CommonValuesModel build() {
    return CommonValuesModel()
      ..animation = ref.watch(animationCommonProvider)
      ..color = ref.watch(colorCommonProvider)
      ..opacity = ref.watch(opacityCommonProvider)
      ..radius = ref.watch(radiusCommonProvider)
      ..size = ref.watch(sizeCommonProvider)
      ..textStyle = ref.watch(textStyleCommonProvider)
      ..theme = ref.watch(themeDataCommonProvider);
  }
}

class CommonValuesModel {
  late final AnimationCommonModel animation;
  late final ColorCommonModel color;
  late final OpacityCommonModel opacity;
  late final RadiusCommonModel radius;
  late final SizeCommonModel size;
  late final TextStyleCommonModel textStyle;
  late final ThemeData theme;
}
