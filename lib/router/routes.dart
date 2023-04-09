import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../providers/apple_music/providers.dart';
import '../ui/pages/home_page.dart';
import '../ui/pages/music_info_pages/recently_played_list_page.dart';
import '../ui/pages/music_info_pages/song_kind_detail_page.dart';
import '../ui/pages/settings_page.dart';

part 'routes.g.dart';

@TypedGoRoute<RootRoute>(
  path: "/",
)
class RootRoute extends GoRouteData {
  @override
  String redirect(BuildContext context, GoRouterState state) {
    return HomePageRoute().location;
  }
}

@TypedGoRoute<HomePageRoute>(
  path: "/home",
)
class HomePageRoute extends GoRouteData {
  final String? from;

  HomePageRoute({this.from});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    if (from != null && from == "nav") {
      return const NoTransitionPage<void>(
        child: HomePage(),
      );
    } else {
      return const MaterialPage<void>(
        child: HomePage(),
      );
    }
  }
}

@TypedGoRoute<SettingsPageRoute>(
  path: "/settings",
)
class SettingsPageRoute extends GoRouteData {
  final String? from;

  SettingsPageRoute({this.from});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    if (from == "nav") {
      return const NoTransitionPage<void>(
        child: SettingsPage(),
      );
    } else {
      return const MaterialPage<void>(
        child: SettingsPage(),
      );
    }
  }
}

@TypedGoRoute<RecentlyPlayedSongsPageRoute>(
  path: "/recently-played",
)
class RecentlyPlayedSongsPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RecentlyPlayedListPage();
  }
}

@TypedGoRoute<SongKindDetailPageRoute>(
  path: "/song-detail/:id",
)
class SongKindDetailPageRoute extends GoRouteData {
  final String id;
  final SongKind? $extra;

  SongKindDetailPageRoute(this.id, {this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SongKindDetailPage(
      id,
      data: $extra,
    );
  }
}
