import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../pages/music_info/album_detail_page.dart';
import '../../paths.dart';
import '../util_methods.dart';

class AlbumDetailLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => [
        appPath.albumDetailPattern,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final id = state.queryParameters["id"];
    if (id != null) {
      return generatePageHistory(
        context: context,
        parameters: beamParameters,
        path: appPath.albumDetail(id),
        title: "Album Detail",
        child: AlbumDetailPage(id: id),
      );
    } else {
      return context.currentBeamPages;
    }
  }
}
