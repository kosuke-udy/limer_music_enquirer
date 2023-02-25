import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/am_test.dart';
import 'layout/app_body.dart';
import 'layout/app_top_bar.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AppBody(
      topBar: AppTopBar("Home"),
      fillRemaining: true,
      body: AmTest(),
    );
  }
}
