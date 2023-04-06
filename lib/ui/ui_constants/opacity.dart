import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'opacity.g.dart';

@riverpod
class OpacityConstants extends _$OpacityConstants {
  @override
  OpacityConstantsModel build() => OpacityConstantsModel()
    ..infoIcon = 0.70
    ..outline = 0.12
    ..hover = 0.08
    ..focus = 0.12
    ..pressed = 0.12
    ..dragged = 0.16;
}

class OpacityConstantsModel {
  // final double infoIcon = 0.70;
  // final double outline = 0.12;

  // State layer
  // final double hover = 0.08;
  // final double focus = 0.12;
  // final double pressed = 0.12;
  // final double dragged = 0.16;

  late final double infoIcon;
  late final double outline;
  late final double hover, focus, pressed, dragged;
}
