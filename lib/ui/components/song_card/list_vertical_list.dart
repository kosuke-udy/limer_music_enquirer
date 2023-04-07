import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../ui_constants/ui_constants.dart';
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
    final constants = ref.watch(uiConstantsProvider);
    return Column(
      children: songs
          .map((e) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _paddingHorizontal,
                vertical: constants.size.insetsMedium,
              ),
              child: SongListCard(song: e)))
          .toList(),
    );
  }
}
