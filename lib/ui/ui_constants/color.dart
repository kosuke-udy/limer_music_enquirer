import 'package:flutter/material.dart';

class ColorConstants {
  Color divider(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface.withOpacity(0.12);

  Color subtitle(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface.withOpacity(0.6);
}
