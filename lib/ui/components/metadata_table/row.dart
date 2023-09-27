import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:hooks_riverpod/hooks_riverpod.dart';
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> Stashed changes

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
  final double keyAreaWidth;
  final String? valueText;

  /* ---------- Constructor ---------- */

  const MetadataTableRow({
    Key? key,
    this.maxLines,
    required this.keyText,
    required this.keyAreaWidth,
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
            padding: const EdgeInsets.only(
              right: _keyAreaWidthAdjustment,
            ),
            margin: EdgeInsets.only(
              right: spacingKeyToValue,
            ),
            width: keyAreaWidth - _horizontalMargin,
            child: Text(
              keyText,
              style: keyTextStyle,
              textAlign: TextAlign.right,
              textWidthBasis: TextWidthBasis.parent,
              maxLines: maxLines,
              overflow: maxLines != null ? TextOverflow.ellipsis : null,
            ),
          ),
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
