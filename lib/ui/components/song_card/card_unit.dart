import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:hooks_riverpod/hooks_riverpod.dart';
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> Stashed changes

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../../db/settings/metadata/ap_song.dart';
import 'part_metadata.dart';
import 'part_main.dart';

class SongCardUnit extends ConsumerWidget {
  /* ---------- Properties ---------- */

  final SongKind song;
  final ApSongMetadataSettingCollection metadataSetting;
  final double artworkAreaSize;
  final int? mainCardMaxLines;
  final void Function()? onTapMainCard;
  final int? metadataRowMaxCount;
  final int? metadataTableMaxLines;

  /* ---------- Constructor ---------- */

  const SongCardUnit({
    Key? key,
    required this.song,
    required this.metadataSetting,
    required this.artworkAreaSize,
    this.mainCardMaxLines,
    this.onTapMainCard,
    this.metadataRowMaxCount,
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
            mainCardArtworkAreaSize: artworkAreaSize,
            rowMaxCount: metadataRowMaxCount,
            tableMaxLines: metadataTableMaxLines,
          ),
          GestureDetector(
            onTap: onTapMainCard,
            child: SongCardMainPart(
              song: song,
              artworkAreaSize: artworkAreaSize,
              maxLines: mainCardMaxLines,
            ),
          ),
        ],
      ),
    );
  }
}
