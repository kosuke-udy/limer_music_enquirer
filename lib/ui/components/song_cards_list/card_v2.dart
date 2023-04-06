import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../../router/routes.dart';
import '../../common_parts/common_parts.dart';
import '../../ui_constants/ui_constants.dart';

class SongCardV2 extends ConsumerWidget {
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

  SongCardV2({
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

    final mainAreaHeight = _artworkSize + constants.size.insetsSmall * 2;

    return FilledCard(
      margin: EdgeInsets.only(
        top: constants.size.insetsSmall,
        right: constants.size.insetsSmall,
        left: constants.size.insetsSmall,
      ),
      child: Column(
        children: [
          _mainArea(
            context,
            ref,
            constants,
            height: mainAreaHeight,
          ),
          Divider(
            height: 1,
            color: constants.color.divider,
          ),
          _attributesArea(
            context,
            ref,
            constants,
          ),
        ],
      ),
    );
  }

  /* ---------- Main Area ---------- */

  Widget _mainArea(
    BuildContext context,
    WidgetRef ref,
    UiConstantsModel constants, {
    required double height,
  }) {
    final songNameTextStyle = constants.textStyle.title.copyWith(
      fontSize: 14,
    );

    return Padding(
      padding: EdgeInsets.all(
        constants.size.insetsSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /* ---------- Artwork ---------- */

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
    );
  }

  /* ---------- Attributes Area ---------- */

  Widget _attributesArea(
    BuildContext context,
    WidgetRef ref,
    UiConstantsModel constants,
  ) {
    final keyTextStyle =
        constants.textStyle.subtitleGray.copyWith(fontSize: 12);
    final valueTextStyle = constants.textStyle.subtitle.copyWith(fontSize: 14);

    final attributeRows = <String, String?>{
      "Artist": artistName,
      "Album": albumName,
      "Composer": composerName,
    }
        .entries
        .map((e) => Container(
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 2),
        ...attributeRows,
        SizedBox(height: constants.size.insetsSmall),
      ],
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
        top: 6,
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
}
