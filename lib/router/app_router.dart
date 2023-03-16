import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import 'nav_destinations.dart';
import 'routes.dart';

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
            return ScreenScaffold(
              body: child,
              destinations: ref.watch(navDestinationsProvider),
            );
          },
        ),
      ],
    );
  }
}
