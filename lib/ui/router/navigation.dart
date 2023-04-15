import 'package:flutter/material.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../translations.g.dart';

final navDestinations = [
  NavWidgetDestination(
    icon: const Icon(Icons.home),
    labelText: t.nav.home,
  ),
  NavWidgetDestination(
    icon: const Icon(Icons.search),
    labelText: t.nav.search,
  ),
  NavWidgetDestination(
    icon: const Icon(Icons.settings),
    labelText: t.nav.settings,
  ),
];
