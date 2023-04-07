import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../../router/routes.dart';
import '../../common_methods/color_extension.dart';
import '../../common_parts/common_parts.dart';
import '../../ui_constants/ui_constants.dart';

class SongListCard extends ConsumerWidget {
  /* ---------- Statics ---------- */

  static const _artworkSize = 76.0;
  static const _fontSize = 14.0;

  /* ---------- Properties ---------- */

  final SongKind song;

  late final String songName, artistName;
  late final String? composerName, albumName;
  late final String artworkUrl;
  late final Color? bgColor;

  /* ---------- Constructor ---------- */

  SongListCard({
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
  }

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(uiConstantsProvider);

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
            ),
            _topCard(
              context,
              ref,
              constants,
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
    UiConstantsModel constants,
  ) {
    final songNameTextStyle = constants.textStyle.title.copyWith(
      fontSize: _fontSize,
    );

    return GestureDetector(
      onTap: () => SongKindDetailPageRoute(song.id, $extra: song).push(context),
      child: FilledCard(
        elevation: 4,
        color: bgColor?.aptCardBgFront(),
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
      ),
    );
  }

  /* ---------- Bottom Card ---------- */

  Widget _bottomCard(
    BuildContext context,
    WidgetRef ref,
    UiConstantsModel constants,
  ) {
    final attributeRows = <String, String?>{
      "Artist": artistName,
      "Album": albumName,
      "Composer": composerName,
    }
        .entries
        .map((e) => _tableRow(
              context,
              ref,
              constants,
              keyText: e.key,
              valueText: e.value,
            ))
        .toList();

    return FilledCard(
      elevation: 0,
      color: bgColor?.aptCardBgBack(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: _artworkSize + constants.size.insetsSmall),
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
    required String? valueText,
  }) {
    final constants = ref.watch(uiConstantsProvider);

    final keyTextStyle =
        constants.textStyle.subtitleGray.copyWith(fontSize: _fontSize - 2);
    final valueTextStyle = (valueText == null
            ? constants.textStyle.subtitleGray
            : constants.textStyle.subtitle)
        .copyWith(fontSize: _fontSize);

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
            width: _artworkSize - constants.size.insetsSmall,
            child: Text(
              keyText,
              style: keyTextStyle,
              maxLines: 1,
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
