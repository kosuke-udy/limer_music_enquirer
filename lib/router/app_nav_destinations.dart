import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../page/layout/nav_widget_destination.dart';

part 'app_nav_destinations.g.dart';

@Riverpod(keepAlive: true)
class AppNavDestinations extends _$AppNavDestinations {
  @override
  List<NavWidgetDestination> build() {
    return [
      NavWidgetDestination(
        icon: const Icon(Icons.home),
        labelText: 'Home',
      ),
      NavWidgetDestination(
        icon: const Icon(Icons.settings),
        labelText: 'Settings',
      ),
    ];
  }
}
