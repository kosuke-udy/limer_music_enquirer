import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'size.g.dart';

@riverpod
class SizeConstants extends _$SizeConstants {
  @override
  SizeConstantsModel build() => SizeConstantsModel();
}

class SizeConstantsModel {
  // Insets
  final double insetsSmall = 4.0;
  final double insetsMedium = 8.0;
  final double insetsLarge = 16.0;

  // Artwork
  final double artworkSmall = 40.0;
  final double artworkMedium = 60.0;
  final double artworkLarge = 80.0;
}
