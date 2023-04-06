import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import 'card.dart';
import 'card_v2.dart';

class SongCardListHorizontal extends ConsumerWidget {
  final List<SongKind> songs;

  const SongCardListHorizontal(this.songs, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: constraints.maxWidth,
          maxHeight: 180,
        ),
        child: PageView(
          controller: PageController(viewportFraction: 0.9),
          children: songs.map((e) => SongCard(song: e)).toList(),
        ),
      ),
    );
  }
}
