import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_values/common_values.dart';

class MetadataTableRow extends ConsumerWidget {
  /* ---------- Statics ---------- */

  static const _fontSize = 13.0;
  static const _spacingTweak = 2.0;

  /* ---------- Properties ---------- */

  final String keyText;
  final String? valueText;
  final double keyAreaWidth;
  final int? maxLines;

  /* ---------- Constructor ---------- */

  const MetadataTableRow({
    Key? key,
    required this.keyText,
    this.valueText,
    required this.keyAreaWidth,
    this.maxLines,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);

    final keyTextStyle =
        common.textStyle.subtitleGray.copyWith(fontSize: _fontSize - 2);
    final valueTextStyle = (valueText == null
            ? common.textStyle.subtitleGray
            : common.textStyle.subtitle)
        .copyWith(fontSize: _fontSize);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        SizedBox(width: common.size.insetsSmall),
        SizedBox(
          width: keyAreaWidth - _spacingTweak - common.size.insetsSmall,
          child: Text(
            keyText,
            style: keyTextStyle,
            textAlign: TextAlign.right,
            maxLines: maxLines,
            overflow: maxLines != null ? TextOverflow.ellipsis : null,
          ),
        ),
        SizedBox(width: common.size.insetsLarge + _spacingTweak),
        Expanded(
          child: Text(
            valueText ?? "No data",
            style: valueTextStyle,
            maxLines: maxLines,
            overflow: maxLines != null ? TextOverflow.ellipsis : null,
          ),
        ),
        SizedBox(width: common.size.insetsSmall),
      ],
    );
  }
}
