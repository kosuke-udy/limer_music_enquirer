import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'animation.dart';
import 'color.dart';
import 'opacity.dart';
import 'radius.dart';
import 'size.dart';
import 'text_style.dart';
import 'theme.dart';

part 'ui_constants.g.dart';

@riverpod
class UiConstants extends _$UiConstants {
  @override
  UiConstantsModel build() {
    return UiConstantsModel()
      ..animation = ref.watch(animationConstantsProvider)
      ..color = ref.watch(colorConstantsProvider)
      ..opacity = ref.watch(opacityConstantsProvider)
      ..radius = ref.watch(radiusConstantsProvider)
      ..size = ref.watch(sizeConstantsProvider)
      ..textStyle = ref.watch(textStyleConstantsProvider)
      ..theme = ref.watch(themeDataConstantsProvider);
  }
}

class UiConstantsModel {
  late final AnimationConstantsModel animation;
  late final ColorConstantsModel color;
  late final OpacityConstantsModel opacity;
  late final RadiusConstantsModel radius;
  late final SizeConstantsModel size;
  late final TextStyleConstantsModel textStyle;
  late final ThemeData theme;
}
