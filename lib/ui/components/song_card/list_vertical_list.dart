import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../ui_constants/ui_constants.dart';
import 'list_card.dart';

class SongCardListVertical extends ConsumerWidget {
  final List<SongKind> songs;

  const SongCardListVertical(this.songs, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(uiConstantsProvider);
    return Column(
      children: songs
          .map((e) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constants.size.insetsLarge,
                vertical: constants.size.insetsSmall,
              ),
              child: SongListCard(song: e)))
          .toList(),
    );
  }
}
