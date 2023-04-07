import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_methods/color_extension.dart';
import '../../common_parts/common_parts.dart';
import '../../ui_constants/ui_constants.dart';

class SongTitleCard extends ConsumerWidget {
  /* ---------- Statics ---------- */

  static const _fontSize = 14.0;
  static const _textSpacing = 4.0;

  /* ---------- Properties ---------- */

  final String name, artistName, artworkUrl;
  final double artworkSize, elevation;
  final Color? bgColorBase;
  final bool fullDisplayed;

  /* ---------- Constructor ---------- */

  const SongTitleCard({
    Key? key,
    required this.name,
    required this.artistName,
    required this.artworkUrl,
    required this.artworkSize,
    required this.fullDisplayed,
    this.elevation = 0,
    this.bgColorBase,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(uiConstantsProvider);

    final nameTextStyle = constants.textStyle.title.copyWith(
      fontSize: _fontSize,
    );
    final artistTextStyle = constants.textStyle.subtitle.copyWith(
      fontSize: _fontSize - 1,
    );

    return FilledCard(
      elevation: elevation,
      color: bgColorBase?.aptCardBgColor(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /* ---------- Artwork ---------- */

          RoundedImage.network(
            artworkUrl,
            size: artworkSize,
          ),
          SizedBox(width: constants.size.insetsLarge),

          /* ---------- Song Name ---------- */

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: nameTextStyle,
                  maxLines: fullDisplayed ? 2 : 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: _textSpacing),
                Text(
                  artistName,
                  style: artistTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          /* ---------- Ellipsis Icon ---------- */

          Container(
            padding: EdgeInsets.all(
              constants.size.insetsSmall,
            ),
            child: const Icon(
              Icons.more_horiz,
            ),
          ),
        ],
      ),
    );
  }
}
