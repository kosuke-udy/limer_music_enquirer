import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common_values/common_values.dart';

class Headline extends ConsumerWidget {
  final String text;
  final void Function()? onTap;

  const Headline(
    this.text, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: common.size.insetsLarge,
          vertical: common.size.insetsSmall,
        ),
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 22),
            ),
            SizedBox(width: common.size.insetsSmall),
            onTap != null && onTap != () {}
                ? Icon(Icons.chevron_right, color: common.color.infoIcon)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
