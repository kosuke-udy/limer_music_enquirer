import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../../db/settings/metadata/ap_song.dart';
import '../../../router/routes.dart';
import 'card_unit.dart';

class SongListCard extends ConsumerWidget {
  /* ---------- Statics ---------- */

  static const _artworkSize = 76.0;
  static const _metadataMaxCount = 3;

  /* ---------- Properties ---------- */

  final SongKind song;
  final ApSongMetadataSettingCollection metadataSetting;

  /* ---------- Constructor ---------- */

  const SongListCard({
    Key? key,
    required this.song,
    required this.metadataSetting,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SongCardUnit(
      song: song,
      metadataSetting: metadataSetting,
      metadataMaxCount: _metadataMaxCount,
      artworkSize: _artworkSize,
      onTopCardTap: () =>
          SongDetailPageRoute(song.id, $extra: song).push(context),
    );
  }
}
