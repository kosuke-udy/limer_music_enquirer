import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../pages/music_info/recently_played_tracks_page.dart';
import '../pages/music_info/song_detail_page.dart';
import '../pages/settings_subs/ap_storefront_setting_page.dart';
import '../pages/settings_subs/song_metadata_order_setting_page.dart';
import '../pages/home_page.dart';
import '../pages/settings_page.dart';
import 'paths.dart';

ValueKey getPageKey(String path) {
  const divider = "-";
  return ValueKey(path.replaceFirst("/", "").replaceAll("/", "-") +
      divider +
      DateTime.now().millisecondsSinceEpoch.toString());
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
    final nextPage = BeamPage(
      key: getPageKey(appPath.recentlyPlayedTracks),
      title: "Recently Played Tracks",
      child: const RecentlyPlayedTracksPage(),
    );

    return [
      ...context.currentBeamPages.last.key == nextPage.key
          ? (context.currentBeamPages..removeLast())
          : context.currentBeamPages,
      nextPage,
    ];
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
      final nextPage = BeamPage(
        key: getPageKey(appPath.songDetail(id)),
        title: "Song Detail",
        child: SongDetailPage(id),
      );
      return [
        ...context.currentBeamPages.last.key == nextPage.key
            ? (context.currentBeamPages..removeLast())
            : context.currentBeamPages,
        nextPage,
      ];
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
