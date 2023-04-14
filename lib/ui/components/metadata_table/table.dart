import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_values/common_values.dart';
import 'row.dart';

class MetadataTable extends ConsumerWidget {
  /* ---------- Fixed Values ---------- */

  static const _spacingSmall = 6.0;
  static const _spacingLarge = 12.0;

  /* ---------- Properties ---------- */

  final double keyAreaWidth;
  final int? maxLines;
  final Map<String, String?> metadataMap;

  /* ---------- Constructor ---------- */

  const MetadataTable({
    Key? key,
    required this.keyAreaWidth,
    this.maxLines,
    required this.metadataMap,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: metadataMap.entries.map((entry) {
        return Column(
          children: [
            entry.key != metadataMap.keys.first
                ? maxLines == null
                    ? Divider(
                        height: _spacingLarge,
                        color: common.color.divider.withOpacity(0),
                      )
                    : const SizedBox(height: _spacingSmall)
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
