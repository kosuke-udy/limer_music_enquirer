import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'color.dart';
import 'opacity.dart';
import 'radius.dart';
import 'size.dart';

export 'color.dart';
export 'opacity.dart';
export 'radius.dart';
export 'size.dart';

part 'ui_constants.g.dart';

@riverpod
class UiConstants extends _$UiConstants {
  @override
  UiConstantsModel build() => UiConstantsModel(
        color: ColorConstants().build(),
        opacity: OpacityConstants().build(),
        radius: RadiusConstants().build(),
        size: SizeConstants().build(),
      );
}

class UiConstantsModel {
  final ColorConstantsModel color;
  final OpacityConstantsModel opacity;
  final RadiusConstantsModel radius;
  final SizeConstantsModel size;

  UiConstantsModel({
    required this.color,
    required this.opacity,
    required this.radius,
    required this.size,
  });
}
