import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../ui_constants/ui_constants.dart';

class FilledCard extends ConsumerWidget {
  final Widget child;
  final EdgeInsets margin;

  const FilledCard({
    Key? key,
    required this.child,
    this.margin = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(uiConstantsProvider);
    return Card(
      margin: margin,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .outline
                .withOpacity(constants.opacity.normal)),
        borderRadius: BorderRadius.circular(constants.radius.medium),
      ),
      color: Theme.of(context)
          .colorScheme
          .onSurface
          .withOpacity(constants.opacity.focus),
      child: child,
    );
  }
}

class OutlinedCard extends ConsumerWidget {
  final Widget child;
  final EdgeInsets margin;

  const OutlinedCard({
    Key? key,
    required this.child,
    this.margin = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(uiConstantsProvider);
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: margin,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .outline
                .withOpacity(constants.opacity.normal)),
        borderRadius: BorderRadius.circular(constants.radius.medium),
      ),
      color: Theme.of(context).colorScheme.surface,
      child: child,
    );
  }
}

class ElevatedCard extends ConsumerWidget {
  final Widget child;
  final EdgeInsets margin;

  const ElevatedCard({
    Key? key,
    required this.child,
    this.margin = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(uiConstantsProvider);
    return Card(
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(constants.radius.medium),
      ),
      color: Theme.of(context).colorScheme.surfaceVariant,
      elevation: 8,
      child: child,
    );
  }
}
