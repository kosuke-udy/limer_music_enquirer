import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../ui_constants/ui_constants.dart';

class AttributesTableRow extends ConsumerWidget {
  /* ---------- Statics ---------- */

  static const _fontSize = 13.0;
  static const _spacingTweak = 2.0;

  /* ---------- Properties ---------- */

  final double keyAreaWidth;
  final int? maxLines;
  final String keyText;
  final String? valueText;

  /* ---------- Constructor ---------- */

  const AttributesTableRow({
    Key? key,
    required this.keyAreaWidth,
    this.maxLines,
    required this.keyText,
    this.valueText,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(uiConstantsProvider);

    final keyTextStyle =
        constants.textStyle.subtitleGray.copyWith(fontSize: _fontSize - 2);
    final valueTextStyle = (valueText == null
            ? constants.textStyle.subtitleGray
            : constants.textStyle.subtitle)
        .copyWith(fontSize: _fontSize);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        SizedBox(width: constants.size.insetsSmall),
        SizedBox(
          width: keyAreaWidth - _spacingTweak - constants.size.insetsSmall,
          child: Text(
            keyText,
            style: keyTextStyle,
            textAlign: TextAlign.right,
            maxLines: maxLines,
            overflow: maxLines != null ? TextOverflow.ellipsis : null,
          ),
        ),
        SizedBox(width: constants.size.insetsLarge + _spacingTweak),
        Expanded(
          child: Text(
            valueText ?? "No data",
            style: valueTextStyle,
            maxLines: maxLines,
            overflow: maxLines != null ? TextOverflow.ellipsis : null,
          ),
        ),
        SizedBox(width: constants.size.insetsSmall),
      ],
    );
  }
}
