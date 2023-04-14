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
  /* ---------- Fixed Values ---------- */

  static const double _elevation = 1;

  /* ---------- Properties ---------- */

  final SongKind song;
  final ApSongMetadataSettingCollection setting;
  final double keyAreaWidth;
  final int? maxCount;
  final int? tableMaxLines;

  /* ---------- Constructor ---------- */

  const SongCardMetadataPart({
    Key? key,
    required this.song,
    required this.setting,
    required this.keyAreaWidth,
    this.maxCount,
    this.tableMaxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);
    final bgColorBase = song.attributes?.artwork.bgColor;

    return FilledCard(
      elevation: _elevation,
      color: bgColorBase?.aptCardBgColor(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: keyAreaWidth + common.size.insetsSmall),
          MetadataTable(
            maxLines: tableMaxLines,
            metadataMap: _generateMetadataMap(song, setting, maxCount),
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
  int? maxCount,
) {
  final result = <String, String?>{};
  final isLibrarySong = song.type == ResourceType.librarySongs;
  bool hasClassicalValue = false;

  // Traverses order and stores keys and values in the result
  final order =
      maxCount == null ? setting.order : setting.order.take(maxCount).toList();
  for (final info in order) {
    final value = getApSongMetadataValue(song, info);
    hasClassicalValue = info.type.isClassical && value != null;
    if (!info.isVisible || !(isLibrarySong && info.type.isCatalogs)) {
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
