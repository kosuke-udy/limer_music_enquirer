import 'package:flutter/material.dart';

class EllipsisText extends StatelessWidget {
  const EllipsisText(
    this.text, {
    Key? key,
    this.style,
    this.maxLines = 1,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
