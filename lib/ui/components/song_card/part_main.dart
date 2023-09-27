import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:hooks_riverpod/hooks_riverpod.dart';
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> Stashed changes

import '../../../api/apple_music_api/models/models.dart';
import '../../data_converter/general/color.dart';
import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';

class SongCardMainPart extends ConsumerWidget {
  /* ---------- Fixed Values ---------- */

  static const double _elevation = 4;
  static const double _textSpacing = 4.0;

  /* ---------- Properties ---------- */

  final SongKind song;
  final double artworkAreaSize;
  final int? maxLines;

  /* ---------- Constructor ---------- */

  const SongCardMainPart({
    Key? key,
    required this.song,
    required this.artworkAreaSize,
    this.maxLines = 2,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Attributes Data
    final songAttributes = song.attributes!;

    final name = songAttributes.name;
    final artistName = songAttributes.artistName;
    final artworkUrl = songAttributes.artwork.url300;
    final bgColor = songAttributes.artwork.bgColor?.tune(
      params: TuningParams.songCardTopDark,
    );

    final common = ref.watch(commonValuesProvider);

    // Text styles
    final nameTextStyle = common.textStyle.cardTitle;
    final artistNameTextStyle = common.textStyle.cardSubtitle;

    // Max lines
    final mainAreaMaxHeight = artworkAreaSize - common.size.insetsMedium * 2;
    final maxLinesUnit = _getMaxLinesUnit(
      name,
      nameTextStyle,
      artistName,
      artistNameTextStyle,
      _textSpacing,
      mainAreaMaxHeight,
    );

    return FilledCard(
      elevation: _elevation,
      color: bgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /* ---------- Artwork ---------- */

          Container(
            width: artworkAreaSize,
            height: artworkAreaSize,
            margin: EdgeInsets.only(
              right: common.size.insetsSmall,
            ),
            padding: EdgeInsets.all(common.size.insetsSmall),
            child: ElevatedCard(
              child: RoundedImage.network(
                artworkUrl,
              ),
            ),
            // child: FilledCard(
            //   color: artworkAreaBgColor,
            //   elevation: 8,
            //   child: Padding(
            //     padding: const EdgeInsets.all(8),
            //     child: RoundedImage.network(
            //       artworkUrl,
            //     ),
            //   ),
            // ),
          ),

          /* ---------- Text Area ---------- */

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: nameTextStyle,
                  maxLines: maxLinesUnit.name,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: _textSpacing),
                Text(
                  artistName,
                  style: artistNameTextStyle,
                  maxLines: maxLinesUnit.artistName,
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

class _MaxLinesUnit {
  final int? name;
  final int? artistName;

  const _MaxLinesUnit({
    required this.name,
    required this.artistName,
  });
}

// Only support for 2 or 3 lines
_MaxLinesUnit _getMaxLinesUnit(
  String nameText,
  TextStyle nameTextStyle,
  String artistNameText,
  TextStyle artistNameTextStyle,
  double textSpacing,
  double maxHeight,
) {
  const roughMaxWidth = 200.0;

  final nameTextPainter =
      _getTextPainter(nameText, nameTextStyle, roughMaxWidth);
  final artistNameTextPainter =
      _getTextPainter(artistNameText, artistNameTextStyle, roughMaxWidth);

  final totalHeight =
      nameTextPainter.height + artistNameTextPainter.height + textSpacing;

  final nameLineCount = nameTextPainter.computeLineMetrics().length;
  final artistNameLineCount = artistNameTextPainter.computeLineMetrics().length;
  if (totalHeight <= maxHeight) {
    return _MaxLinesUnit(
      name: nameLineCount,
      artistName: artistNameLineCount,
    );
  } else {
    final setHeight = nameTextPainter.preferredLineHeight +
        artistNameTextPainter.preferredLineHeight +
        textSpacing;
    final surplusHeight = maxHeight - setHeight;
    if (nameLineCount == 1 &&
        surplusHeight >= nameTextPainter.preferredLineHeight) {
      return const _MaxLinesUnit(
        name: 1,
        artistName: 2,
      );
    } else if (nameLineCount >= 2 &&
        surplusHeight >= nameTextPainter.preferredLineHeight) {
      return const _MaxLinesUnit(
        name: 2,
        artistName: 1,
      );
    } else {
      return const _MaxLinesUnit(
        name: 1,
        artistName: 1,
      );
    }
  }
}

TextPainter _getTextPainter(
  String text,
  TextStyle textStyle,
  double maxWidth,
) {
  return TextPainter(
    text: TextSpan(
      text: text,
      style: textStyle,
    ),
    textDirection: TextDirection.ltr,
  )..layout(maxWidth: maxWidth);
}
