import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'animation.g.dart';

@riverpod
class AnimationCommon extends _$AnimationCommon {
  @override
  AnimationCommonModel build() {
    return AnimationCommonModel()
      ..animationDuration = const Duration(milliseconds: 300)
      ..transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder;
  }
}

class AnimationCommonModel {
  late final Duration animationDuration;
  late final AnimatedSwitcherTransitionBuilder transitionBuilder;
}
