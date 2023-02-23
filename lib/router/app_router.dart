import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'routes.dart';
import '../pages/layout/app_layout.dart';
import '../pages/layout/nav_widget_destination.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
class AppRouter extends _$AppRouter {
  @override
  GoRouter build() {
    return GoRouter(
      routes: [
        ShellRoute(
          routes: $appRoutes,
          builder: (context, state, child) {
            return AppLayout(
              body: child,
              destinations: [
                NavWidgetDestination(
                  icon: const Icon(Icons.home),
                  labelText: 'Home',
                ),
                NavWidgetDestination(
                  icon: const Icon(Icons.settings),
                  labelText: 'Settings',
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
