import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../api/apple_music_api/apple_music_api.dart';
import 'nav_destinations.dart';
import 'routes.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
class AppRouter extends _$AppRouter {
  final _apClient = AppleMusicApiClient();

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
      redirect: (context, state) {
        if (_apClient.isInitialized && _apClient.isAuthorizedByUser) {
          return null;
        } else {
          return "/loading";
        }
      },
    );
  }
}
