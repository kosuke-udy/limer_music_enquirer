import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../providers/apple_music/providers.dart';
import '../ui/pages/home_page.dart';
import '../ui/pages/loading_page.dart';
import '../ui/pages/recently_played_list_page.dart';
import '../ui/pages/song_kind_detail_page.dart';

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

@TypedGoRoute<LoadingPageRoute>(
  path: "/loading",
)
class LoadingPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoadingPage();
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    await initClient();

    return HomePageRoute().location;
  }
}

@TypedGoRoute<HomePageRoute>(
  path: "/home",
)
class HomePageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
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
