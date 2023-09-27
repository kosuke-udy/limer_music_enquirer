import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import 'router/navigation.dart';
import 'router/router_delegates.dart';

final tabRouterDelegates = [
  nowPlayingTabRouterDelegate,
  recentlyPlayedTabRouterDelegate,
  settingsTabRouterDelegate,
];

class AppScreen extends StatelessWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      bodyStackChildren: tabRouterDelegates.map((delegate) {
        return Beamer(
          routerDelegate: delegate,
        );
      }).toList(),
      destinations: navDestinations,
      onDestinationSelected: (currentIndex, newIndex) {
        if (currentIndex != newIndex) {
          tabRouterDelegates[currentIndex].update(rebuild: false);
        }
      },
    );
  }
}
