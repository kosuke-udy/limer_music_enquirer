import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common_values/common_values.dart';

class FilledCard extends ConsumerWidget {
  final Widget child;
  final EdgeInsets margin;
  final Color? color;
  final double elevation;

  const FilledCard({
    Key? key,
    required this.child,
    this.margin = const EdgeInsets.all(0),
    this.color,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);

    return Card(
      elevation: elevation,
      margin: margin,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .outline
                .withOpacity(common.opacity.outline)),
        borderRadius: BorderRadius.circular(common.radius.medium),
      ),
      color: color ??
          Theme.of(context)
              .colorScheme
              .onSurface
              .withOpacity(common.opacity.focus),
      child: child,
    );
  }
}

class OutlinedCard extends ConsumerWidget {
  final Widget child;
  final EdgeInsets margin;
  final Color? color;
  final double elevation;

  const OutlinedCard({
    Key? key,
    required this.child,
    this.margin = const EdgeInsets.all(0),
    this.color,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: margin,
      color: color ?? Theme.of(context).colorScheme.surface,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .outline
                .withOpacity(common.opacity.outline)),
        borderRadius: BorderRadius.circular(common.radius.medium),
      ),
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
    final common = ref.watch(commonValuesProvider);
    return Card(
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(common.radius.medium),
      ),
      color: Theme.of(context).colorScheme.surfaceVariant,
      elevation: 8,
      child: child,
    );
  }
}
