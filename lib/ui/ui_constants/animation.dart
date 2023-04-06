import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'animation.g.dart';

@riverpod
class AnimationConstants extends _$AnimationConstants {
  @override
  AnimationConstantsModel build() {
    return AnimationConstantsModel()
      ..animationDuration = const Duration(milliseconds: 300)
      ..transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder;
  }
}

class AnimationConstantsModel {
  late final Duration animationDuration;
  late final AnimatedSwitcherTransitionBuilder transitionBuilder;
}
