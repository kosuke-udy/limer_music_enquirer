import 'package:flutter/material.dart';

class UiConstants extends InheritedWidget {
  const UiConstants.scope({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static UiConstants of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<UiConstants>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  // Constants
  final horizontalPadding = 16.0;
  final verticalPadding = 8.0;
}
