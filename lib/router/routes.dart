import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/home_page.dart';

part 'routes.g.dart';

@TypedGoRoute<RootRoute>(
  path: "/",
)
class RootRoute extends GoRouteData {
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return $homePageRoute.path;
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
