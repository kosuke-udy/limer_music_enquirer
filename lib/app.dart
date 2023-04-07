import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'ui/common_values/common_values.dart';
import 'router/app_router.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Limer',
      routerConfig: ref.watch(appRouterProvider),
      theme: ref.watch(commonValuesProvider).theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
