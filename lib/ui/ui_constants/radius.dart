import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'radius.g.dart';

@riverpod
class RadiusConstants extends _$RadiusConstants {
  @override
  RadiusConstantsModel build() => RadiusConstantsModel();
}

class RadiusConstantsModel {
  final double small = 4.0;
  final double medium = 8.0;
  final double large = 16.0;
}
