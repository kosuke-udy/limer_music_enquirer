import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../utils/app_logger.dart';
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
    "Tab: $tabName",
    "Move to ${delegate.currentBeamLocation.state.routeInformation.uri}"
  ]);
}

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
  },
);

/* ---------- RecentlyPlayed Tab ---------- */

final recentlyPlayedTabRouterDelegate = BeamerDelegate(
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
  },
);

/* ---------- Settings Tab Router Delegate ---------- */

final settingsTabRouterDelegate = BeamerDelegate(
  updateParent: false,
  initialPath: appPath.settings,
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      SettingsLocation(),
    ],
  ),
  buildListener: (context, delegate) {
    logRoute("Settings", delegate);
  },
);
