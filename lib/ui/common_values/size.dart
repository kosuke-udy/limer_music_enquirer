import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'size.g.dart';

@riverpod
class SizeCommon extends _$SizeCommon {
  @override
  SizeCommonModel build() {
    return SizeCommonModel();
  }
}

class SizeCommonModel {
  // Insets
  final double insetsSmall = 8.0;
  final double insetsMedium = 12.0;
  final double insetsLarge = 16.0;

  // Padding
  final double screenPadding = 20.0;

  // Icon
  final double infoIcon = 16.0;
  final double moreIconHeight = 14.0;
}
