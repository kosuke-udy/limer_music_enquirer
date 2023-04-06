import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../api/apple_music_api/apple_music_api.dart';
import '../ui/pages/home_page.dart';
import '../ui/pages/loading_page.dart';
import '../ui/pages/recently_played_list_page.dart';

part 'routes.g.dart';

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
    // Get Tokens
    // devToken = await generateDeveloperToken();
    // userToken = await requestUserToken(devToken);
    final devToken =
        await rootBundle.loadString("auth/apple_music/mock_dev_token");
    final userToken =
        await rootBundle.loadString("auth/apple_music/mock_user_token");

    final apClient = AppleMusicApiClient();
    apClient.initialize(
      devToken: devToken,
      userToken: userToken,
    );

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
  path: "/recently-played-songs",
)
class RecentlyPlayedSongsPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RecentlyPlayedListPage();
  }
}
