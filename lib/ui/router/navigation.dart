import 'package:flutter/material.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../translations.g.dart';

final navDestinations = [
  NavWidgetDestination(
    icon: const Icon(Icons.music_note),
    labelText: t.nav.nowPlaying,
  ),
  NavWidgetDestination(
    icon: const Icon(Icons.history),
    labelText: t.nav.recentlyPlayed,
  ),
  NavWidgetDestination(
    icon: const Icon(Icons.settings),
    labelText: t.nav.settings,
  ),
];
