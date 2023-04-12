import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/models/models.dart';
import '../../../db/settings/metadata/ap_song.dart';
import '../../../translations.g.dart';
import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';
import '../../data_converter/general/color_extension.dart';
import '../../data_converter/metadata/ap_song.dart';
import '../metadata_table/table.dart';

class SongCardMetadataPart extends ConsumerWidget {
  /* ---------- Properties ---------- */

  final SongKind song;
  final ApSongMetadataSettingCollection setting;
  final double keyAreaWidth;
  final int? maxLines;

  /* ---------- Constructor ---------- */

  const SongCardMetadataPart(
      {Key? key,
      required this.song,
      required this.setting,
      required this.keyAreaWidth,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);
    final bgColorBase = song.attributes?.artwork.bgColor;

    return FilledCard(
      elevation: 1,
      color: bgColorBase?.aptCardBgColor(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: keyAreaWidth + common.size.insetsSmall),
          MetadataTable(
            maxLines: 1,
            metadataMap: _generateMetadataMap(song, setting, maxLines),
            keyAreaWidth: keyAreaWidth,
          ),
          SizedBox(height: common.size.insetsSmall),
        ],
      ),
    );
  }
}

Map<String, String?> _generateMetadataMap(
  SongKind song,
  ApSongMetadataSettingCollection setting,
  int? maxLines,
) {
  final songAttributes = song.attributes;
  if (songAttributes == null) {
    return const {};
  } else {
    final result = <String, String?>{};
    final isLibrarySong = song.type == ResourceType.librarySongs;
    bool hasClassicalValue = false;

    // Traverses order and stores keys and values in the result
    final order = maxLines == null
        ? setting.order
        : setting.order.take(maxLines).toList();
    for (final info in order) {
      final value = getApSongMetadataValue(song, info);
      hasClassicalValue = info.type.isClassical && value != null;
      if (!info.isVisible || isLibrarySong && info.type.isCatalogs) {
        result[t.metadata.song(type: info.type)] = value;
      }
    }

    // Removes classical values if there is no classical value
    if (!hasClassicalValue) {
      for (final classical in ApSongMetadataType.classicalValues) {
        result.remove(t.metadata.song(type: classical));
      }
    }

    return result;
  }
}
