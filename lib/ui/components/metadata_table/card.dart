import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';
import '../../common_methods/common_methods.dart';
import 'table.dart';

class MetadataTableCard extends ConsumerWidget {
  /* ---------- Properties ---------- */

  final Map<String, String?> metadataMap;
  final double keyAreaWidth;
  final Color? bgColorBase;

  /* ---------- Constructor ---------- */

  const MetadataTableCard({
    Key? key,
    required this.metadataMap,
    required this.keyAreaWidth,
    this.bgColorBase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);

    return FilledCard(
      elevation: 1,
      color: bgColorBase?.aptCardBgColor(0),
      child: Padding(
        padding: EdgeInsets.symmetric(
          // horizontal: common.size.insetsSmall,
          vertical: common.size.insetsMedium,
        ),
        child: MetadataTable(
          keyAreaWidth: keyAreaWidth,
          metadataMap: metadataMap,
        ),
      ),
    );
  }
}
