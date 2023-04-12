import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../../router/routes.dart';
import '../../common_values/common_values.dart';
import 'part_metadata.dart';
import 'part_title.dart';

class SongListCard extends ConsumerWidget {
  /* ---------- Statics ---------- */

  static const _artworkSize = 76.0;

  /* ---------- Properties ---------- */

  final SongKind song;

  late final String songName, artistName;
  late final String? composerName, albumName;
  late final String artworkUrl;
  late final Color? bgColor;

  /* ---------- Constructor ---------- */

  SongListCard({
    Key? key,
    required this.song,
  }) : super(key: key) {
    artworkUrl = song.attributes!.artwork.url100;
    songName = song.attributes!.name;
    artistName = song.attributes!.artistName;
    albumName = song.attributes!.albumName;

    if (song is Songs) {
      composerName = (song as Songs).attributes!.composerName;
    } else {
      composerName = null;
    }

    bgColor = song.attributes?.artwork.bgColor;
  }

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);

    final metadataMap = <String, String?>{
      "Artist": artistName,
      "Album": albumName,
      "Composer": composerName,
    };

    return SizedBox(
      child: Stack(
        children: [
          SongCardMetadataPart(
            metadataMap: metadataMap,
            keyAreaWidth: _artworkSize,
            bgColorBase: bgColor,
          ),
          GestureDetector(
            onTap: () =>
                SongDetailPageRoute(song.id, $extra: song).push(context),
            child: SongCardTitlePart(
              name: songName,
              artistName: artistName,
              artworkUrl: artworkUrl,
              artworkSize: _artworkSize,
              elevation: 0.1,
              fullDisplayed: false,
              bgColorBase: bgColor,
            ),
          ),
        ],
      ),
    );
  }
}