import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../ui_constants/ui_constants.dart';

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
    final constants = ref.watch(uiConstantsProvider);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: constants.size.insetsLarge,
        vertical: constants.size.insetsSmall,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(width: constants.size.insetsSmall),
            onTap != null && onTap != () {}
                ? Icon(Icons.chevron_right, color: constants.color.infoIcon)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
