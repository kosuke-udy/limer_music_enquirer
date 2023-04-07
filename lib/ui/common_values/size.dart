import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'size.g.dart';

@riverpod
class SizeCommon extends _$SizeCommon {
  @override
  SizeCommonModel build() {
    return SizeCommonModel()
      ..insetsSmall = 8.0
      ..insetsMedium = 12.0
      ..insetsLarge = 16.0
      ..artworkSmall = 46.0
      ..artworkMedium = 80.0
      ..artworkLarge = 120.0
      ..moreIconWidth = 14.0
      ..songCardHeight = 134.0;
  }
}

class SizeCommonModel {
  // Insets
  late final double insetsSmall, insetsMedium, insetsLarge;

  // Artwork
  late final double artworkSmall, artworkMedium, artworkLarge;

  // Icon
  // late final double infoIcon = 12.0;
  late final double moreIconWidth;

  // Card
  late final double songCardHeight;
}
