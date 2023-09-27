import 'package:beamer/beamer.dart';
<<<<<<< Updated upstream
import 'package:flutter/material.dart';
=======
>>>>>>> Stashed changes
import 'package:fpdart/fpdart.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../utils/app_logger.dart';
<<<<<<< Updated upstream
import 'locations/home/home_location.dart';
import 'locations/music_info/album_detail_location.dart';
import 'locations/music_info/recently_played_tracks_location.dart';
import 'locations/music_info/song_detail_location.dart';
import 'locations/search/search_location.dart';
import 'locations/settings/settings_location.dart';
import 'navigation.dart';
import 'paths.dart';

/* ---------- App Router Delegate ---------- */

final appRouterDelegate = BeamerDelegate(
    initialPath: appPath.home,
    beamBackTransitionDelegate: const ReverseTransitionDelegate(),
    locationBuilder: RoutesLocationBuilder(routes: {
      '*': (context, state, data) {
        return ScreenScaffold(
          bodyStackChildren: tabRouterDelegates.mapWithIndex((delegate, index) {
            return Beamer(
              routerDelegate: delegate,
              // backButtonDispatcher: tabBackButtonDispatchers[index],
            );
          }).toList(),
          destinations: navDestinations,
          onDestinationSelected: (currentIndex, newIndex) {
            if (currentIndex != newIndex) {
              tabRouterDelegates[currentIndex].update(rebuild: false);
            }
          },
        );
      }
    }));

final backButtonDispatcher = BeamerBackButtonDispatcher(
  delegate: appRouterDelegate,
  alwaysBeamBack: true,
  onBack: (delegate) async {
    delegate.beamBack();
    return true;
  },
);

final tabRouterDelegates = [
  nowPlayingTabRouterDelegate,
  recentlyPlayedTabRouterDelegate,
  settingsTabRouterDelegate,
];

void logRoute(String tabName, BeamerDelegate delegate) {
  AppLogger.get("logRoute").info([
=======
import '../pages/music_info/recently_played_tracks_page.dart';
import '../pages/music_info/song_detail_page.dart';
import 'locations/music_info/nowplaying_location.dart';
import 'locations/music_info/recently_played_tracks_location.dart';
import 'locations/music_info/song_detail_location.dart';
import 'locations/settings/settings_location.dart';
import 'paths.dart';

import '../app_screen.dart';

/* ---------- App Router Delegate ---------- */

// final backButtonDispatcher = BeamerBackButtonDispatcher(
//   delegate: appRouterDelegate,
//   alwaysBeamBack: true,
//   onBack: (delegate) async {
//     delegate.beamBack();
//     return true;
//   },
// );

final appRouterDelegate = BeamerDelegate(
  initialPath: appPath.nowPlaying,
  beamBackTransitionDelegate: const ReverseTransitionDelegate(),
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '*': (_, __, ___) => const AppScreen(),
    },
  ),
);

void _logRoute(String tabName, BeamerDelegate delegate) {
  AppLogger.get("_logRoute").info([
>>>>>>> Stashed changes
    "Tab: $tabName",
    "Move to ${delegate.currentBeamLocation.state.routeInformation.uri}"
  ]);
}

<<<<<<< Updated upstream
// /* ---------- Home Tab ---------- */

// final homeTabRouterDelegate = BeamerDelegate(
//   initialPath: appPath.home,
//   locationBuilder: BeamerLocationBuilder(
//     beamLocations: [
//       HomeLocation(),
//       AlbumDetailLocation(),
//       RecentlyPlayedTracksLocation(),
//       SongDetailLocation(),
//     ],
//   ),
//   buildListener: (context, delegate) {
//     logRoute("Home", delegate);
//   },
// );

/* ---------- NowPlaying Tab ---------- */

final nowPlayingTabRouterDelegate = BeamerDelegate(
  updateParent: false,
  initialPath: appPath.songDetail(),
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      SongDetailLocation(),
    ],
  ),
  buildListener: (context, delegate) {
    logRoute("NowPlaying", delegate);
=======
/* ---------- NowPlaying Tab ---------- */

final nowPlayingTabRouterDelegate = BeamerDelegate(
  initialPath: appPath.nowPlaying,
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      NowPlayingLocation(),
    ],
  ),
  buildListener: (context, delegate) {
    _logRoute("NowPlaying", delegate);
>>>>>>> Stashed changes
  },
);

/* ---------- RecentlyPlayed Tab ---------- */

final recentlyPlayedTabRouterDelegate = BeamerDelegate(
<<<<<<< Updated upstream
  updateParent: false,
  initialPath: appPath.recentlyPlayedTracks,
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      RecentlyPlayedTracksLocation(),
      SongDetailLocation(),
    ],
  ),
  buildListener: (context, delegate) {
    logRoute("RecentlyPlayed", delegate);
=======
  initialPath: appPath.recentlyPlayedTracks,
  // locationBuilder: BeamerLocationBuilder(
  //   beamLocations: [
  //     RecentlyPlayedTracksLocation(),
  //     SongDetailLocation(),
  //   ],
  // ),
  locationBuilder: RoutesLocationBuilder(
    routes: {
      appPath.recentlyPlayedTracks: (_, __, ___) =>
          const RecentlyPlayedTracksPage(),
      appPath.songDetail: (_, state, ___) => SongDetailPage(
            id: state.queryParameters["id"] ?? "",
          ),
    },
  ),
  routeListener: (routeInformation, delegate) {
    _logRoute("RecentlyPlayed", delegate);
>>>>>>> Stashed changes
  },
);

/* ---------- Settings Tab Router Delegate ---------- */

final settingsTabRouterDelegate = BeamerDelegate(
<<<<<<< Updated upstream
  updateParent: false,
=======
>>>>>>> Stashed changes
  initialPath: appPath.settings,
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      SettingsLocation(),
    ],
  ),
  buildListener: (context, delegate) {
<<<<<<< Updated upstream
    logRoute("Settings", delegate);
=======
    _logRoute("Settings", delegate);
>>>>>>> Stashed changes
  },
);
