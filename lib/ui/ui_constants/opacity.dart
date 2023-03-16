import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'opacity.g.dart';

@riverpod
class OpacityConstants extends _$OpacityConstants {
  @override
  OpacityConstantsModel build() => OpacityConstantsModel();
}

class OpacityConstantsModel {
  final double normal = 0.12;

  // State layer
  final double hover = 0.08;
  final double focus = 0.12;
  final double pressed = 0.12;
  final double dragged = 0.16;
}
