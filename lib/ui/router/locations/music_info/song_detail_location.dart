import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

import '../../../pages/music_info/song_detail_page.dart';
import '../../paths.dart';
import '../util_methods.dart';

class SongDetailLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => [
        appPath.songDetailPattern,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final id = state.queryParameters["id"];
    final isNowPlaying = state.queryParameters["nowPlaying"] == "true";

    if (id != null && id.isNotEmpty) {
      return generatePageHistory(
        context: context,
        parameters: beamParameters,
        path: appPath.songDetail(id: id),
        title: "Songs Detail",
        child: SongDetailPage(id: id),
      );
    } else {
      return generatePageHistory(
        context: context,
        parameters: beamParameters,
        path: appPath.songDetail(),
        title: "Songs Detail",
        child: const SongDetailPage(
          isNowPlaying: true,
        ),
      );
    }
  }
}
