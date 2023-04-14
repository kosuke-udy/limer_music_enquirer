import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/models/models.dart';
import '../../data_converter/general/color_extension.dart';
import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';

class SongCardMainPart extends ConsumerWidget {
  /* ---------- Fixed Values ---------- */

  static const double _bgColorLightnessAddition = 0.13;
  static const double _elevation = 4;
  static const double _nameFontSize = 14.0;
  static const double _artistNameFontSize = 13.0;
  static const double _textSpacing = 4.0;

  /* ---------- Properties ---------- */

  final SongKind song;
  final double artworkSize;
  final int? maxLines;

  /* ---------- Constructor ---------- */

  const SongCardMainPart({
    Key? key,
    required this.song,
    required this.artworkSize,
    required this.maxLines,
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

    final nameWidth = _getTextWidth(nameTextStyle, name);
    final artistNameWidth = _getTextWidth(artistTextStyle, artistName);
    final nameMaxLines = maxLines == null
        ? null
        : nameWidth > artistNameWidth
            ? ((maxLines as double) / 2.0).ceil()
            : ((maxLines as double) / 2.0).floor();
    final artistNameMaxLines =
        maxLines == null ? null : maxLines! - nameMaxLines!;

    return FilledCard(
      elevation: _elevation,
      color: bgColorBase?.aptCardBgColor(
        lightnessAddition: _bgColorLightnessAddition,
      ),
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

          /* ---------- Text Area ---------- */

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: nameTextStyle,
                  maxLines: nameMaxLines,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: _textSpacing),
                Text(
                  artistName,
                  style: artistTextStyle,
                  maxLines: artistNameMaxLines,
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

  // Get Text widget width when render as single line
  double _getTextWidth(TextStyle style, String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width;
  }
}
