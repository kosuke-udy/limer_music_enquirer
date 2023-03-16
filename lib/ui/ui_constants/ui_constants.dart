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
UiConstants uiConstants(UiConstantsRef ref) => UiConstants();

class UiConstants {
  final color = ColorConstants();
  final opacity = OpacityConstants();
  final radius = RadiusConstants();
  final size = SizeConstants();
}
