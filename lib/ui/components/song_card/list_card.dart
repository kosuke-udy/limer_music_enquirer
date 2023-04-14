import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../../db/settings/metadata/ap_song.dart';
import '../../../router/routes.dart';
import 'card_unit.dart';

class SongListCard extends ConsumerWidget {
  /* ---------- Fixed Values ---------- */

  static const double _artworkSize = 76.0;
  static const int _metadataMaxCount = 3;
  static const int _metadataTableMaxLines = 1;
  void Function() onTopCardTap(BuildContext context) =>
      () => SongDetailPageRoute(song.id, $extra: song).push(context);

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
      artworkSize: _artworkSize,
      metadataMaxCount: _metadataMaxCount,
      metadataTableMaxLines: _metadataTableMaxLines,
      onTopCardTap: onTopCardTap(context),
    );
  }
}
