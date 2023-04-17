import 'package:beamer/beamer.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import 'locations.dart';
import 'navigation.dart';
import 'paths.dart';

final appRouterDelegate = BeamerDelegate(
    initialPath: appPath.home,
    locationBuilder: RoutesLocationBuilder(routes: {
      '*': (context, state, data) {
        return ScreenScaffold(
          bodyStackChildren: tabRouterDelegates.map((delegate) {
            return Beamer(
              routerDelegate: delegate,
              backButtonDispatcher: BeamerBackButtonDispatcher(
                delegate: delegate,
              ),
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

final tabRouterDelegates = [
  homeTabRouterDelegate,
  searchTabRouterDelegate,
  settingsTabRouterDelegate,
];

final homeTabRouterDelegate = BeamerDelegate(
  initialPath: appPath.home,
  locationBuilder: (routeInformation, params) {
    if (routeInformation.location != null &&
        HomeLocation().pathPatterns.contains(routeInformation.location)) {
      return HomeLocation();
    } else {
      return HomeLocation();
    }
  },
);

final searchTabRouterDelegate = BeamerDelegate(
  initialPath: appPath.search,
  locationBuilder: (routeInformation, params) {
    if (routeInformation.location != null &&
        SearchLocation().pathPatterns.contains(routeInformation.location)) {
      return SearchLocation();
    } else {
      return SearchLocation();
    }
  },
);

final settingsTabRouterDelegate = BeamerDelegate(
  initialPath: appPath.settings,
  locationBuilder: (routeInformation, params) {
    if (routeInformation.location!.contains(appPath.settings)) {
      return SettingsLocation();
    } else {
      return SettingsLocation();
    }
  },
);
