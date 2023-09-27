import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:hooks_riverpod/hooks_riverpod.dart';
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> Stashed changes

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../../db/settings/metadata/ap_song.dart';
import 'list_card.dart';

class SongCardListHorizontal extends ConsumerWidget {
  /* ---------- Fixed Values ---------- */

  static const _maxHeight = 155.0;
  static const _viewportFraction = 0.917;
  static const _horizontalPadding = 8.0;

  /* ---------- Properties ---------- */

  final List<SongKind> songs;
  final ApSongMetadataSettingCollection metadataSetting;

  /* ---------- Constructor ---------- */

  const SongCardListHorizontal({
    Key? key,
    required this.songs,
    required this.metadataSetting,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              padding: const EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
              ),
              child: SongListCard(
                song: e,
                metadataSetting: metadataSetting,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
