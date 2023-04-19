import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../pages/music_info/recently_played_tracks_page.dart';
import '../pages/music_info/song_detail_page.dart';
import '../pages/settings_subs/ap_storefront_setting_page.dart';
import '../pages/settings_subs/song_metadata_order_setting_page.dart';
import '../pages/home_page.dart';
import '../pages/settings_page.dart';
import 'paths.dart';

String getPageKeyValue(String path) {
  // const divider = "-";
  // return ValueKey(path.replaceFirst("/", "").replaceAll("/", "-") +
  //     divider +
  //     DateTime.now().millisecondsSinceEpoch.toString());
  return path.replaceFirst("/", "").replaceAll("/", "-");
}

ValueKey<String> getPageKey(String path) {
  return ValueKey(getPageKeyValue(path));
}

List<BeamPage> generatePageHistory({
  required BuildContext context,
  required BeamParameters parameters,
  required String path,
  required String title,
  required Widget child,
}) {
  final currentPages = context.currentBeamPages;
  final keyValue = getPageKeyValue(path);

  final index =
      currentPages.indexWhere((element) => element.key == ValueKey(keyValue));
  if (index != -1) {
    final isBack = parameters.transitionDelegate is ReverseTransitionDelegate;

    if (isBack) {
      return currentPages.sublist(0, index + 1);
    } else {
      return [
        ...currentPages,
        BeamPage(
          key: ValueKey("$keyValue-${DateTime.now().millisecondsSinceEpoch}"),
          title: title,
          child: child,
        ),
      ];
    }
  } else {
    return [
      ...context.currentBeamPages,
      BeamPage(
        key: ValueKey(keyValue),
        title: title,
        child: child,
      ),
    ];
  }
}

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => [
        appPath.home,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: getPageKey(appPath.home),
        title: "Home",
        child: const HomePage(),
      ),
    ];
  }
}

class RecentlyPlayedTracksLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => [
        appPath.recentlyPlayedTracks,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return generatePageHistory(
      context: context,
      parameters: beamParameters,
      path: appPath.recentlyPlayedTracks,
      title: "Recently Played Tracks",
      child: const RecentlyPlayedTracksPage(),
    );
  }
}

class SongDetailLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => [
        appPath.songDetailPattern,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final id = state.queryParameters["id"];
    if (id != null) {
      return generatePageHistory(
        context: context,
        parameters: beamParameters,
        path: appPath.songDetail(id),
        title: "Song Detail",
        child: SongDetailPage(id),
      );
    } else {
      return context.currentBeamPages;
    }
  }
}

class SearchLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/search'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: getPageKey("/search"),
        title: "Search",
        child: const Center(
          child: Text("Search"),
        ),
      ),
    ];
  }
}

class SettingsLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => [
        '/settings',
        '/settings/*',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = <BeamPage>[
      BeamPage(
        key: getPageKey(appPath.settings),
        title: "Settings",
        child: const SettingsPage(),
      ),
    ];

    if (state.pathPatternSegments.length > 1) {
      switch (state.pathPatternSegments[1]) {
        case 'ap-storefront':
          pages.add(
            BeamPage(
              key: getPageKey(appPath.settingsApStorefront),
              title: "Apple Music Storefront Setting",
              child: const ApStorefrontSettingPage(),
            ),
          );
          break;
        case 'song-metadata-order':
          pages.add(
            BeamPage(
              key: getPageKey(appPath.settingsSongMetadataOrder),
              title: "Song Metadata Order Setting",
              child: const SongMetadataOrderSettingPage(),
            ),
          );
          break;
        default:
          pages.add(
            const BeamPage(
              key: ValueKey("setting-not-found"),
              title: "Setting Not Found",
              child: Center(
                child: Text("Setting Not Found"),
              ),
            ),
          );
          break;
      }
    }

    return pages;
  }
}
