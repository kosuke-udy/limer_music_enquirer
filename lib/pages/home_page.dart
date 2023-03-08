import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/am_api_test.dart';
import 'layout/app_body.dart';
import 'layout/app_top_bar.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBody(
      topBar: const AppTopBar("Home"),
      fillRemaining: true,
      body: Column(
        children: [
          AmApiTest(),
        ],
      ),
    );
  }
}
