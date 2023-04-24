import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../pages/settings_subs/ap_storefront_setting_page.dart';
import '../../../pages/settings_subs/song_metadata_order_setting_page.dart';
import '../../../pages/settings_page.dart';
import '../../paths.dart';
import '../util_methods.dart';

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
