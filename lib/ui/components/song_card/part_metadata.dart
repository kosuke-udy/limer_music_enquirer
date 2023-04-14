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
  static const double _tableAreaVerticalPaddingWithLimit = 8.0;
  static const double _tableAreaVerticalPaddingWithoutLimit = 16.0;

  /* ---------- Properties ---------- */

  final SongKind song;
  final ApSongMetadataSettingCollection setting;
  final int? tableMaxLines;
  final int? rowMaxCount;
  final double keyAreaWidth;

  /* ---------- Constructor ---------- */

  const SongCardMetadataPart({
    Key? key,
    required this.song,
    required this.setting,
    required this.keyAreaWidth,
    this.rowMaxCount,
    this.tableMaxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);
    final bgColorBase = song.attributes?.artwork.bgColor;

    final tableAreaVearticalPadding = rowMaxCount == null
        ? _tableAreaVerticalPaddingWithoutLimit
        : _tableAreaVerticalPaddingWithLimit;

    return FilledCard(
      elevation: _elevation,
      color: bgColorBase?.aptCardBgColor(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: keyAreaWidth),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: tableAreaVearticalPadding,
            ),
            child: MetadataTable(
              maxLines: tableMaxLines,
              metadataMap: _generateMetadataMap(song, setting, rowMaxCount),
              keyAreaWidth: keyAreaWidth,
            ),
          ),
        ],
      ),
    );
  }
}

Map<String, String?> _generateMetadataMap(
  SongKind song,
  ApSongMetadataSettingCollection setting,
  int? rowMaxCount,
) {
  final result = <String, String?>{};
  final isLibrarySong = song.type == ResourceType.librarySongs;
  bool hasClassicalValue = false;

  // Traverses order and stores keys and values in the result
  final order = rowMaxCount == null
      ? setting.order
      : setting.order.take(rowMaxCount).toList();
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
