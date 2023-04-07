import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../ui_constants/ui_constants.dart';
import 'row.dart';

class AttributesTable extends ConsumerWidget {
  /* ---------- Statics ---------- */

  static const _spacingSmall = 6.0;
  static const _spacingLarge = 12.0;

  /* ---------- Properties ---------- */

  final double keyAreaWidth;
  final int? maxLines;
  final Map<String, String?> attributes;

  /* ---------- Constructor ---------- */

  const AttributesTable({
    Key? key,
    required this.keyAreaWidth,
    this.maxLines,
    required this.attributes,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(uiConstantsProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: attributes.entries.map((entry) {
        return Column(
          children: [
            entry.key != attributes.keys.first
                ? maxLines == null
                    ? Divider(
                        height: _spacingLarge,
                        color: constants.color.divider.withOpacity(0),
                      )
                    : const SizedBox(height: _spacingSmall)
                : const SizedBox.shrink(),
            AttributesTableRow(
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
