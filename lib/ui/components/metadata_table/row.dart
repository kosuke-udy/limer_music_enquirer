import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_values/common_values.dart';

class MetadataTableRow extends ConsumerWidget {
  /* ---------- Fixed Values ---------- */

  static const double _keyFontSize = 11.0;
  static const double _keyAreaWidthAdjustment = 2.0;
  static const double _valueFontSize = 13.0;
  static const String _nullValueText = 'No Data';

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
        common.textStyle.subtitleGray.copyWith(fontSize: _keyFontSize);
    final valueTextStyle = (valueText == null
            ? common.textStyle.subtitleGray
            : common.textStyle.subtitle)
        .copyWith(fontSize: _valueFontSize);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: common.size.insetsSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          SizedBox(
            width: keyAreaWidth -
                _keyAreaWidthAdjustment -
                common.size.insetsSmall,
            child: Text(
              keyText,
              style: keyTextStyle,
              textAlign: TextAlign.right,
              maxLines: maxLines,
              overflow: maxLines != null ? TextOverflow.ellipsis : null,
            ),
          ),
          SizedBox(width: common.size.insetsLarge + _keyAreaWidthAdjustment),
          Expanded(
            child: Text(
              valueText ?? _nullValueText,
              style: valueTextStyle,
              maxLines: maxLines,
              overflow: maxLines != null ? TextOverflow.ellipsis : null,
            ),
          ),
        ],
      ),
    );
  }
}
