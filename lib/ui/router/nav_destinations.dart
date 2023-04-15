import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../translations.g.dart';

part 'nav_destinations.g.dart';

@Riverpod(keepAlive: true)
class NavDestinations extends _$NavDestinations {
  @override
  List<NavWidgetDestination> build() {
    return [
      NavWidgetDestination(
        icon: const Icon(Icons.home),
        labelText: t.nav.home,
      ),
      NavWidgetDestination(
        icon: const Icon(Icons.search),
        labelText: t.nav.search,
      ),
      NavWidgetDestination(
        icon: const Icon(Icons.settings),
        labelText: t.nav.settings,
      ),
    ];
  }
}
