import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../ui_constants/ui_constants.dart';

class Headline extends ConsumerWidget {
  const Headline(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(uiConstantsProvider);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: constants.size.insetsLarge,
        vertical: constants.size.insetsMedium,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
