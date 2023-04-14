import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../../db/settings/metadata/ap_song.dart';
import 'part_metadata.dart';
import 'part_title.dart';

class SongCardUnit extends ConsumerWidget {
  /* ---------- Properties ---------- */

  final SongKind song;
  final ApSongMetadataSettingCollection metadataSetting;
  final double artworkSize;
  final void Function()? onTopCardTap;
  final int? metadataMaxCount;
  final int? metadataTableMaxLines;

  /* ---------- Constructor ---------- */

  const SongCardUnit({
    Key? key,
    required this.song,
    required this.metadataSetting,
    required this.artworkSize,
    this.onTopCardTap,
    this.metadataMaxCount,
    this.metadataTableMaxLines,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: Stack(
        children: [
          SongCardMetadataPart(
            song: song,
            setting: metadataSetting,
            keyAreaWidth: artworkSize,
            maxCount: metadataMaxCount,
            tableMaxLines: metadataTableMaxLines,
          ),
          GestureDetector(
            onTap: onTopCardTap,
            child: SongCardTitlePart(
              song: song,
              artworkSize: artworkSize,
              fullDisplayed: false,
            ),
          ),
        ],
      ),
    );
  }
}
