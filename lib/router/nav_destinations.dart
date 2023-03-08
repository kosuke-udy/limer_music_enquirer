import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../widget/layout/app_layout.dart';

part 'nav_destinations.g.dart';

@Riverpod(keepAlive: true)
class NavDestinations extends _$NavDestinations {
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
