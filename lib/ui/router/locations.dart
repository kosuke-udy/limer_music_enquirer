import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../pages/music_info/recently_played_tracks_page.dart';
import '../pages/music_info/song_detail_page.dart';
import '../pages/settings_subs/ap_storefront_setting_page.dart';
import '../pages/settings_subs/song_metadata_order_setting_page.dart';
import '../pages/home_page.dart';
import '../pages/settings_page.dart';
import 'paths.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => [
        appPath.home,
        appPath.recentlyPlayedSongs,
        appPath.songDetailPattern,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey("home"),
        title: "Home Tab",
        // type: BeamPageType.noTransition,
        child: HomePage(),
      ),
    ];

    if (state.uri.path == appPath.recentlyPlayedSongs) {
      pages.add(
        const BeamPage(
          key: ValueKey("recently-played-songs"),
          title: "Recently Played Songs",
          child: RecentlyPlayedTracksPage(),
        ),
      );
    } else if (state.uriBlueprint.path == appPath.songDetailPattern) {
      final id = state.pathParameters["id"];
      if (id != null) {
        pages.add(
          BeamPage(
            key: ValueKey("song-detail-$id"),
            title: "Song Detail",
            child: SongDetailPage(id),
          ),
        );
      }
    }

    return pages;
  }
}

class SearchLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/search'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey("search"),
        title: "Search",
        child: Center(
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
      const BeamPage(
        key: ValueKey("settings"),
        title: "Settings",
        child: SettingsPage(),
      ),
    ];

    if (state.pathPatternSegments.length > 1) {
      switch (state.pathPatternSegments[1]) {
        case 'ap-storefront':
          pages.add(
            const BeamPage(
              key: ValueKey("setting-ap-storefront"),
              title: "Apple Music Storefront Setting",
              child: ApStorefrontSettingPage(),
            ),
          );
          break;
        case 'song-metadata-order':
          pages.add(
            const BeamPage(
              key: ValueKey("setting-song-metadata-order"),
              title: "Song Metadata Order Setting",
              child: SongMetadataOrderSettingPage(),
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
