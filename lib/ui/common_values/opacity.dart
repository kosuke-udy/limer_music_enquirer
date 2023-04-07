import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'opacity.g.dart';

@riverpod
class OpacityCommon extends _$OpacityCommon {
  @override
  OpacityCommonModel build() => OpacityCommonModel()
    ..infoIcon = 0.70
    ..outline = 0.12
    ..hover = 0.08
    ..focus = 0.12
    ..pressed = 0.12
    ..dragged = 0.16;
}

class OpacityCommonModel {
  late final double infoIcon;
  late final double outline;
  late final double hover, focus, pressed, dragged;
}
