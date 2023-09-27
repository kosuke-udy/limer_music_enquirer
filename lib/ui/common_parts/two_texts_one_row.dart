import 'dart:math';

import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:hooks_riverpod/hooks_riverpod.dart';
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> Stashed changes

import 'clipped_text.dart';

class TwoTextsOneRow extends ConsumerWidget {
  final Text left, right, divider;
  final int dividerMargin;
  final double leftMaxRatio;

  const TwoTextsOneRow({
    Key? key,
    required this.left,
    required this.right,
    this.divider = const Text(""),
    this.dividerMargin = 0,
    this.leftMaxRatio = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      key: key,
      builder: (context, constraints) {
        final marginedDivider = Padding(
          padding: EdgeInsets.symmetric(horizontal: dividerMargin.toDouble()),
          child: divider,
        );

        final leftWidth = _calculateTextWidth(left);
        final rightWidth = _calculateTextWidth(right);
        final dividerWidth = _calculateTextWidth(divider) + dividerMargin * 2;
        final totalWidth = leftWidth + dividerWidth + rightWidth;

        final maxWidth = constraints.maxWidth - 12;
        final leftMaxWidth = (maxWidth - dividerWidth) * leftMaxRatio;
        final rightMaxWidth = maxWidth - leftMaxWidth - dividerWidth;

        final List<Widget> row = totalWidth <= maxWidth
            ? [
                left,
                marginedDivider,
                right,
              ]
            : rightWidth <= rightMaxWidth
                ? [
                    Expanded(
                      child: ClippedText(
                        left.data!,
                        style: left.style,
                      ),
                    ),
                    marginedDivider,
                    right,
                  ]
                : leftWidth < leftMaxWidth
                    ? [
                        left,
                        marginedDivider,
                        Expanded(
                          child: ClippedText(
                            right.data!,
                            style: right.style,
                          ),
                        ),
                      ]
                    : [
                        SizedBox(
                          width: min(leftWidth, leftMaxWidth),
                          child: ClippedText(
                            left.data!,
                            style: left.style,
                          ),
                        ),
                        marginedDivider,
                        Expanded(
                          child: ClippedText(
                            right.data!,
                            style: right.style,
                          ),
                        ),
                      ];

        return Row(
          children: row,
        );
      },
    );
  }

  double _calculateTextWidth(Text text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text.data,
        style: text.style,
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width;
  }
}
