import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'radius.g.dart';

@riverpod
class RadiusCommon extends _$RadiusCommon {
  @override
  RadiusCommonModel build() => RadiusCommonModel();
}

class RadiusCommonModel {
  final double small = 4.0;
  final double medium = 8.0;
  final double large = 16.0;

  double fromSideLength(double length) {
    if (length < 0) {
      throw ArgumentError.value(length, 'length', 'must be positive');
    } else if (length < medium * 10) {
      return small;
    } else if (length < large * 10) {
      return medium;
    } else {
      return large;
    }
  }
}
