import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../common_parts/m3_cards.dart';
import '../../common_parts/rounded_image.dart';

class AlbumCard extends StatelessWidget {
  /* ---------- Properties ---------- */

  final AlbumKind album;

  const AlbumCard({
    Key? key,
    required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledCard(
      child: Container(),
    );
  }
}
