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

    final keyTextStyle =
        common.textStyle.subtitleGray.copyWith(fontSize: _keyFontSize);
    final valueTextStyle = (valueText == null
            ? common.textStyle.subtitleGray
            : common.textStyle.subtitle)
        .copyWith(fontSize: _valueFontSize);

    final horizontalMargin = common.size.insetsSmall;
    final keyAreaWidth = mainCardArtworkSize - horizontalMargin;
    final spacingKeyToValue = common.size.insetsLarge;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: _keyAreaWidthAdjustment),
            child: SizedBox(
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
