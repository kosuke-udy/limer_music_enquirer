import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../utils/app_logger.dart';
import 'locations.dart';
import 'navigation.dart';
import 'paths.dart';

final backButtonDispatcher = BeamerBackButtonDispatcher(
  delegate: appRouterDelegate,
  alwaysBeamBack: true,
  onBack: (delegate) async {
    delegate.beamBack();
    return true;
  },
);

final appRouterDelegate = BeamerDelegate(
    initialPath: appPath.home,
    beamBackTransitionDelegate: const ReverseTransitionDelegate(),
    locationBuilder: RoutesLocationBuilder(routes: {
      '*': (context, state, data) {
        return ScreenScaffold(
          bodyStackChildren: tabRouterDelegates.mapWithIndex((delegate, index) {
            return Beamer(
              key: tabBeamerKeys[index],
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

final tabBeamerKeys = List.generate(
  tabRouterDelegates.length,
  (index) => GlobalKey<NavigatorState>(),
  growable: false,
);

final tabRouterDelegates = [
  homeTabRouterDelegate,
  searchTabRouterDelegate,
  settingsTabRouterDelegate,
];

final homeTabLogger = AppLogger.get("homeTabRouterDelegate");

final homeTabRouterDelegate = BeamerDelegate(
  initialPath: appPath.home,
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      HomeLocation(),
      RecentlyPlayedTracksLocation(),
      SongDetailLocation(),
    ],
  ),
  buildListener: (context, delegate) {
    homeTabLogger.info([
      // "buildListnener: ${context.beamingHistory}",
      // "currentBeamPages: ${context.currentBeamPages}",
      "Move to ${delegate.currentBeamLocation.state.routeInformation.location}"
    ]);
  },
);

final searchTabLogger = AppLogger.get("searchTabRouterDelegate");

final searchTabRouterDelegate = BeamerDelegate(
  initialPath: appPath.search,
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      SearchLocation(),
    ],
  ),
  buildListener: (context, delegate) {
    searchTabLogger.info([
      // "buildListnener: ${context.beamingHistory}",
      // "currentBeamPages: ${context.currentBeamPages}",
      "Move to ${delegate.currentBeamLocation.state.routeInformation.location}"
    ]);
  },
);

final settingsTabLogger = AppLogger.get("settingsTabRouterDelegate");

final settingsTabRouterDelegate = BeamerDelegate(
  initialPath: appPath.settings,
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      SettingsLocation(),
    ],
  ),
  buildListener: (context, delegate) {
    settingsTabLogger.info([
      // "buildListnener: ${context.beamingHistory}",
      // "currentBeamPages: ${context.currentBeamPages}",
      "Move to ${delegate.currentBeamLocation.state.routeInformation.location}"
    ]);
  },
);
