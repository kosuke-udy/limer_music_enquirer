import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../../router/routes.dart';
import '../../common_parts/common_parts.dart';
import '../../ui_constants/ui_constants.dart';

class SongCard extends ConsumerWidget {
  /* ---------- Statics ---------- */

  static const _artworkSize = 68.0;
  static const _fontSize = 14.0;

  /* ---------- Properties ---------- */

  final SongKind song;

  late final String songName, artistName;
  late final String? composerName, albumName;
  late final String artworkUrl;
  late final Color? bgColor, textColor1, textColor2, textColor3, textColor4;

  /* ---------- Constructor ---------- */

  SongCard({
    Key? key,
    required this.song,
  }) : super(key: key) {
    artworkUrl = song.attributes!.artwork.url100;
    songName = song.attributes!.name;
    artistName = song.attributes!.artistName;
    albumName = song.attributes!.albumName;

    if (song is Songs) {
      composerName = (song as Songs).attributes!.composerName;
    } else {
      composerName = null;
    }

    bgColor = song.attributes?.artwork.bgColor;
    textColor1 = song.attributes?.artwork.textColor1;
    textColor2 = song.attributes?.artwork.textColor2;
    textColor3 = song.attributes?.artwork.textColor3;
    textColor4 = song.attributes?.artwork.textColor4;
  }

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(uiConstantsProvider);

    final topCardHeight = _artworkSize + constants.size.insetsSmall * 2;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: constants.size.insetsSmall,
      ),
      child: SizedBox(
        child: Stack(
          children: [
            _bottomCard(
              context,
              ref,
              constants,
              topCardHeight: topCardHeight,
            ),
            _topCard(
              context,
              ref,
              constants,
              height: topCardHeight,
            ),
          ],
        ),
      ),
    );
  }

  /* ---------- Top Card ---------- */

  Widget _topCard(
    BuildContext context,
    WidgetRef ref,
    UiConstantsModel constants, {
    required double height,
  }) {
    final songNameTextStyle = constants.textStyle.title.copyWith(
      fontSize: 14,
    );

    return Container(
      constraints: BoxConstraints(
        minHeight: height,
        maxHeight: height,
      ),
      child: FilledCard(
        elevation: 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /* ---------- Artwork ---------- */

            SizedBox(width: constants.size.insetsSmall),
            RoundedImage.network(
              artworkUrl,
              size: _artworkSize,
            ),
            SizedBox(width: constants.size.insetsLarge),

            /* ---------- Song Name ---------- */

            Expanded(
              child: Text(
                songName,
                style: songNameTextStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
      ),
    );
  }

  /* ---------- Bottom Card ---------- */

  Widget _bottomCard(
    BuildContext context,
    WidgetRef ref,
    UiConstantsModel constants, {
    required double topCardHeight,
  }) {
    final keyTextStyle =
        constants.textStyle.subtitleGray.copyWith(fontSize: 12);
    final valueTextStyle = constants.textStyle.subtitle.copyWith(fontSize: 14);

    const attributeCount = 1;
    final painter = _getTextPainter(keyTextStyle);
    final attributeTextHeight = painter.preferredLineHeight;
    final attributeRowHeight = attributeTextHeight + constants.size.insetsSmall;
    final bodyHeight = topCardHeight + attributeRowHeight * attributeCount;

    final attributeRows = <String, String?>{
      "Artist": artistName,
      "Album": albumName,
      "Composer": composerName,
    }
        .entries
        .map((e) => Container(
            constraints: BoxConstraints(
              maxHeight: bodyHeight,
            ),
            child: _tableRow(
              context,
              ref,
              constants,
              keyText: e.key,
              keyTextStyle: keyTextStyle,
              valueText: e.value,
              valueTextStyle: valueTextStyle,
            )))
        .toList();

    return FilledCard(
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: topCardHeight + constants.size.insetsSmall),
          ...attributeRows,
        ],
      ),
    );
  }

  /* ---------- Table ---------- */

  Widget _tableRow(
    BuildContext context,
    WidgetRef ref,
    UiConstantsModel constants, {
    required String keyText,
    required TextStyle keyTextStyle,
    required String? valueText,
    required TextStyle valueTextStyle,
  }) {
    final constants = ref.watch(uiConstantsProvider);

    return Padding(
      padding: EdgeInsets.only(
        right: constants.size.insetsSmall,
        left: constants.size.insetsSmall,
        bottom: 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: _artworkSize,
            child: Text(
              keyText,
              style: keyTextStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(width: constants.size.insetsLarge),
          Expanded(
            child: Text(
              valueText ?? "No data",
              style: valueTextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  TextPainter _getTextPainter(TextStyle textStyle) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: "A",
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    return textPainter;
  }
}
