import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'row.dart';

class MetadataTable extends ConsumerWidget {
  /* ---------- Fixed Values ---------- */

  static const _rowSpacingWithLimit = 6.0;
  static const _rowSpacingWithoutLimit = 10.0;

  /* ---------- Properties ---------- */

  final Map<String, String?> metadataMap;
  final int? maxLines;
  final double mainCardArtworkSize;

  /* ---------- Constructor ---------- */

  const MetadataTable({
    Key? key,
    required this.metadataMap,
    this.maxLines,
    required this.mainCardArtworkSize,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rowSpacing =
        maxLines == null ? _rowSpacingWithoutLimit : _rowSpacingWithLimit;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: metadataMap.entries.mapWithIndex((entry, index) {
        return Padding(
          padding: index == 0
              ? EdgeInsets.zero
              : EdgeInsets.only(
                  top: rowSpacing,
                ),
          child: MetadataTableRow(
            mainCardArtworkSize: mainCardArtworkSize,
            maxLines: maxLines,
            keyText: entry.key,
            valueText: entry.value,
          ),
        );
      }).toList(),
    );
  }
}
