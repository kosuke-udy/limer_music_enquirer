import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'layout/app_body.dart';
import 'layout/app_top_bar.dart';
import 'component/am_recently_played.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBody(
      topBar: const AppTopBar("Home"),
      fillRemaining: true,
      body: Column(
        children: const [
          AmRecentlyPlayed(),
        ],
      ),
    );
  }
}
