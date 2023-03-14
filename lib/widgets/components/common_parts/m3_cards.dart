import 'package:flutter/material.dart';

class OutlinedCard extends StatelessWidget {
  const OutlinedCard({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 8.0,
      vertical: 8.0,
    ),
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

class FilledCard extends StatelessWidget {
  const FilledCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: child,
    );
  }
}
