import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../../db/settings/metadata/ap_song.dart';
import '../../../router/routes.dart';
import 'card_unit.dart';

class SongListCard extends ConsumerWidget {
  /* ---------- Fixed Values ---------- */

  static const double _artworkSize = 76.0;

  static const int _mainCardMaxLines = 2;
  void Function() onTapMainCard(BuildContext context) {
    return () => SongDetailPageRoute(song.id, $extra: song).push(context);
  }

  static const int _metadataRowMaxCount = 3;
  static const int _metadataTableMaxLines = 1;

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
      artworkSize: _artworkSize,
      mainCardMaxLines: _mainCardMaxLines,
      onTapMainCard: onTapMainCard(context),
      metadataSetting: metadataSetting,
      metadataRowMaxCount: _metadataRowMaxCount,
      metadataTableMaxLines: _metadataTableMaxLines,
    );
  }
}
