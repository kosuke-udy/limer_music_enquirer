import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

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
