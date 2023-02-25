import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'router/app_router.dart';
import 'preloader.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(asyncPreloaderProvider).when(
          data: (preloads) => MaterialApp.router(
            title: 'Limer',
            theme: ThemeData(
              useMaterial3: true,
            ),
            routerConfig: ref.watch(appRouterProvider),
          ),
          loading: () => const Center(child: SizedBox()),
          error: (err, stack) => Text(err.toString()),
        );
  }
}
