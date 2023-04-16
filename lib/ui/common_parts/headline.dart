import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common_values/common_values.dart';

class Headline extends ConsumerWidget {
  /* ---------- Fixed Values ---------- */

  static const _horizontalPadding = 24.0;
  static const _verticalPadding = 16.0;
  static const _fontSize = 22.0;
  static const _iconSize = 34.0;

  /* ---------- Properties ---------- */

  final String text;
  final void Function()? onTap;

  /* ---------- Constructor ---------- */

  const Headline(
    this.text, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: _horizontalPadding,
          vertical: _verticalPadding,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: _fontSize),
            ),
            onTap != null && onTap != () {}
                ? Icon(
                    Icons.chevron_right,
                    color: common.color.infoIcon,
                    size: _iconSize,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
