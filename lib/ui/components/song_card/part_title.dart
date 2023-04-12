import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data_converter/color_extension.dart';
import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';

class SongCardTitlePart extends ConsumerWidget {
  /* ---------- Statics ---------- */

  static const _fontSize = 14.0;
  static const _textSpacing = 4.0;

  /* ---------- Properties ---------- */

  final String name, artistName, artworkUrl;
  final double artworkSize, elevation;
  final Color? bgColorBase;
  final bool fullDisplayed;

  /* ---------- Constructor ---------- */

  const SongCardTitlePart({
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
    final common = ref.watch(commonValuesProvider);

    final nameTextStyle = common.textStyle.title.copyWith(
      fontSize: _fontSize,
    );
    final artistTextStyle = common.textStyle.subtitle.copyWith(
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
          SizedBox(width: common.size.insetsLarge),

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
              common.size.insetsSmall,
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
