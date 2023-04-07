import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../common_values/common_values.dart';
import 'cards_gathered.dart';

class SongCardListVertical extends ConsumerWidget {
  /* ---------- Statics ---------- */

  static const _paddingHorizontal = 20.0;

  /* ---------- Properties ---------- */

  final List<SongKind> songs;

  /* ---------- Constructor ---------- */

  const SongCardListVertical(this.songs, {Key? key}) : super(key: key);

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
              child: SongListCard(song: e)))
          .toList(),
    );
  }
}
