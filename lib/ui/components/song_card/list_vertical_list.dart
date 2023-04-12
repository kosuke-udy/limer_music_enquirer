import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../../db/settings/metadata/ap_song.dart';
import '../../common_values/common_values.dart';
import 'list_card.dart';

class SongCardListVertical extends ConsumerWidget {
  /* ---------- Statics ---------- */

  static const _paddingHorizontal = 20.0;

  /* ---------- Properties ---------- */

  final List<SongKind> songs;
  final ApSongMetadataSettingCollection metadataSetting;

  /* ---------- Constructor ---------- */

  const SongCardListVertical({
    Key? key,
    required this.songs,
    required this.metadataSetting,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);
    return Column(
      children: songs
          .map((e) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _paddingHorizontal,
                vertical: common.size.insetsMedium,
              ),
              child: SongListCard(
                song: e,
                metadataSetting: metadataSetting,
              )))
          .toList(),
    );
  }
}
