import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/pages/recently_played_page.dart';

part 'routes.g.dart';

@TypedGoRoute<RootRoute>(
  path: "/",
)
class RootRoute extends GoRouteData {
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return $recentlyPlayedPageRoute.path;
  }
}

@TypedGoRoute<RecentlyPlayedPageRoute>(
  path: "/recently-played",
)
class RecentlyPlayedPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RecentlyPlayedPage();
  }
}
