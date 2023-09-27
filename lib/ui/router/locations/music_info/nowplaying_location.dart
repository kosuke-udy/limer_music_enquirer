import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../pages/music_info/song_detail_page.dart';
import '../../paths.dart';
import '../util_methods.dart';

class NowPlayingLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => [
        appPath.nowPlaying,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    // return generatePageHistory(
    //   context: context,
    //   parameters: beamParameters,
    //   path: appPath.nowPlaying,
    //   title: "Songs Detail",
    //   child: const SongDetailPage(
    //     isNowPlaying: true,
    //   ),
    // );
    return [
      BeamPage(
        key: ValueKey(getPageKeyValue(appPath.nowPlaying)),
        title: "Now Playing",
        child: const SongDetailPage(
          isNowPlaying: true,
        ),
      ),
    ];
  }
}
