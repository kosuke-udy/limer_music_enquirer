import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

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
// final List<BeamerChildBackButtonDispatcher> tabBackButtonDispatchers =
//     List.filled(
//   tabRouterDelegates.length,
//   BeamerChildBackButtonDispatcher(
//     delegate: homeTabRouterDelegate,
//     parent: backButtonDispatcher,
//   ),
//   growable: false,
// );

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
    print("buildListnener: ${context.beamingHistory}");
    print("currentBeamPages: ${context.currentBeamPages}");
  },
  routeListener: (routeInformation, delegate) {
    print(routeInformation.location);
  },
);

final searchTabRouterDelegate = BeamerDelegate(
  initialPath: appPath.search,
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      SearchLocation(),
    ],
  ),
);

final settingsTabRouterDelegate = BeamerDelegate(
  initialPath: appPath.settings,
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      SettingsLocation(),
    ],
  ),
);
