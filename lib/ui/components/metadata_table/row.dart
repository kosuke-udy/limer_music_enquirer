import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_values/common_values.dart';
import '../../data_converter/general/text_style.dart';

class MetadataTableRow extends ConsumerWidget {
  /* ---------- Fixed Values ---------- */

  static const double _horizontalMargin = 14.0;
  static const double _keyAreaWidthAdjustment = 2.0;
  static const String _nullValueText = 'No Data';

  /* ---------- Properties ---------- */

  final int? maxLines;
  final String keyText;
  final double mainCardArtworkSize;
  final String? valueText;

  /* ---------- Constructor ---------- */

  const MetadataTableRow({
    Key? key,
    this.maxLines,
    required this.keyText,
    required this.mainCardArtworkSize,
    this.valueText,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);

    // Text styles
    final keyTextStyle = common.textStyle.cardBodySmall.grayedOut();
    final valueTextStyle = (valueText == null
        ? common.textStyle.cardBody.grayedOut()
        : common.textStyle.cardBody);

    // Sizes
    final keyAreaWidth = mainCardArtworkSize - _horizontalMargin;
    final spacingKeyToValue = common.size.insetsLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _horizontalMargin,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Container(
            padding: const EdgeInsets.only(right: _keyAreaWidthAdjustment),
            width: keyAreaWidth - _keyAreaWidthAdjustment,
            child: Text(
              keyText,
              style: keyTextStyle,
              textAlign: TextAlign.right,
              textWidthBasis: TextWidthBasis.parent,
              maxLines: maxLines,
              overflow: maxLines != null ? TextOverflow.ellipsis : null,
            ),
          ),
          SizedBox(width: spacingKeyToValue),
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
