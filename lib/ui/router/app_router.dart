import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import 'navigation.dart';
import 'routes.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
class AppRouter extends _$AppRouter {
  @override
  GoRouter build() {
    return GoRouter(
      initialLocation: HomePageRoute().location,
      routes: [
        ShellRoute(
          routes: $appRoutes,
          builder: (context, state, child) {
            return ScreenScaffold(
              body: child,
              destinations: navDestinations,
              onDestinationSelected: (newIndex) {
                if (newIndex == 0) {
                  HomePageRoute().go(context);
                } else if (newIndex == 2) {
                  SettingsPageRoute().go(context);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
