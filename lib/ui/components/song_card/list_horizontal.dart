import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../common_values/common_values.dart';
import 'list_card.dart';

class SongCardListHorizontal extends ConsumerWidget {
  /* ---------- Statics ---------- */

  static const _maxHeight = 180.0;
  static const _viewportFraction = 0.9;

  /* ---------- Properties ---------- */

  final List<SongKind> songs;

  /* ---------- Constructor ---------- */

  const SongCardListHorizontal(this.songs, {Key? key}) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);

    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: constraints.maxWidth,
          maxHeight: _maxHeight,
        ),
        child: PageView(
          controller: PageController(
            viewportFraction: _viewportFraction,
          ),
          children: songs.map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: common.size.insetsSmall,
              ),
              child: SongListCard(song: e),
            );
          }).toList(),
        ),
      ),
    );
  }
}
