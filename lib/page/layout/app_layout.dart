import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import 'nav_widget_destination.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({
    Key? key,
    required this.body,
    required this.destinations,
  }) : super(key: key);

  final Widget body;
  final List<NavWidgetDestination> destinations;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      internalAnimations: false,
      primaryNavigation: SlotLayout(
        config: {
          Breakpoints.small: SlotLayout.from(
            key: const Key("Primary Navigation Small"),
            builder: (_) => const SizedBox.shrink(),
          ),
          Breakpoints.medium: SlotLayout.from(
            inAnimation: AdaptiveScaffold.leftOutIn,
            key: const Key("Primary Navigation Medium"),
            builder: (_) => AdaptiveScaffold.standardNavigationRail(
              destinations: destinations
                  .map<NavigationRailDestination>(
                      (e) => e.toNavigationRailDestination())
                  .toList(),
            ),
          ),
          Breakpoints.large: SlotLayout.from(
            inAnimation: AdaptiveScaffold.leftOutIn,
            key: const Key("Primary Navigation Large"),
            builder: (_) => AdaptiveScaffold.standardNavigationRail(
              destinations: destinations
                  .map<NavigationRailDestination>(
                      (e) => e.toNavigationRailDestination())
                  .toList(),
            ),
          ),
        },
      ),
      body: SlotLayout(
        config: {
          Breakpoints.small: SlotLayout.from(
            key: const Key("Body Small"),
            builder: (_) => body,
          ),
          Breakpoints.medium: SlotLayout.from(
            key: const Key("Body Medium"),
            builder: (_) => body,
          ),
          Breakpoints.large: SlotLayout.from(
            key: const Key("Body Large"),
            builder: (_) => body,
          ),
        },
      ),
      bottomNavigation: SlotLayout(
        config: {
          Breakpoints.small: SlotLayout.from(
            key: const Key("Bottom Navigation Small"),
            builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
                destinations: destinations
                    .map<NavigationDestination>(
                        (e) => e.toNavigationDestination())
                    .toList()),
          ),
        },
      ),
    );
  }
}
