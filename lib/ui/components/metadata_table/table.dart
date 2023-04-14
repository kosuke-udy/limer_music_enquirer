import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'row.dart';

class MetadataTable extends ConsumerWidget {
  /* ---------- Fixed Values ---------- */

  static const _rowSpacingWithLimit = 6.0;
  static const _rowSpacingWithoutLimit = 12.0;

  /* ---------- Properties ---------- */

  final Map<String, String?> metadataMap;
  final int? maxLines;
  final double keyAreaWidth;

  /* ---------- Constructor ---------- */

  const MetadataTable({
    Key? key,
    required this.metadataMap,
    this.maxLines,
    required this.keyAreaWidth,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rowSpacing =
        maxLines == null ? _rowSpacingWithoutLimit : _rowSpacingWithLimit;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: metadataMap.entries.map((entry) {
        return Column(
          children: [
            entry.key != metadataMap.keys.first
                ? SizedBox(height: rowSpacing)
                : const SizedBox.shrink(),
            MetadataTableRow(
              keyAreaWidth: keyAreaWidth,
              maxLines: maxLines,
              keyText: entry.key,
              valueText: entry.value,
            ),
          ],
        );
      }).toList(),
    );
  }
}
