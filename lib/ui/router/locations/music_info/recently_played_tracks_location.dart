import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../pages/music_info/recently_played_tracks_page.dart';
import '../../paths.dart';
import '../util_methods.dart';

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
