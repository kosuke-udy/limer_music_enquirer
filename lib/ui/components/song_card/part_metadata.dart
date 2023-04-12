import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';
import '../../functions/color_extension.dart';
import '../metadata_table/table.dart';

class SongCardMetadataPart extends ConsumerWidget {
  /* ---------- Properties ---------- */

  final Map<String, String?> metadataMap;
  final double keyAreaWidth;
  final Color? bgColorBase;

  /* ---------- Constructor ---------- */

  const SongCardMetadataPart({
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: keyAreaWidth + common.size.insetsSmall),
          MetadataTable(
            maxLines: 1,
            metadataMap: metadataMap,
            keyAreaWidth: keyAreaWidth,
          ),
          SizedBox(height: common.size.insetsSmall),
        ],
      ),
    );
  }
}
