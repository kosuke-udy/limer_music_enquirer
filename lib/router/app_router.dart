import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_nav_destinations.dart';
import 'routes.dart';
import '../pages/layout/app_layout.dart';

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
              destinations: ref.watch(appNavDestinationsProvider),
            );
          },
        ),
      ],
    );
  }
}
