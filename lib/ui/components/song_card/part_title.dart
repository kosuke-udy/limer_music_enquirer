import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/models/models.dart';
import '../../data_converter/general/color_extension.dart';
import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';

class SongCardTitlePart extends ConsumerWidget {
  /* ---------- Fixed Values ---------- */

  static const double _nameFontSize = 14.0;
  static const double _artistNameFontSize = 13.0;
  static const double _textSpacing = 4.0;
  static const double _elevation = 4;

  /* ---------- Properties ---------- */

  final SongKind song;
  final double artworkSize;
  final bool fullDisplayed;

  /* ---------- Constructor ---------- */

  const SongCardTitlePart({
    Key? key,
    required this.song,
    required this.artworkSize,
    required this.fullDisplayed,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songAttributes = song.attributes!;
    final name = songAttributes.name;
    final artistName = songAttributes.artistName;
    final artworkUrl = songAttributes.artwork.url100;
    final bgColorBase = songAttributes.artwork.bgColor;

    final common = ref.watch(commonValuesProvider);
    final nameTextStyle = common.textStyle.title.copyWith(
      fontSize: _nameFontSize,
    );
    final artistTextStyle = common.textStyle.subtitle.copyWith(
      fontSize: _artistNameFontSize,
    );

    return FilledCard(
      elevation: _elevation,
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
