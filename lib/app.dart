import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/apple_music/init_client.dart';
import 'providers/db/providers.dart';
import 'ui/common_values/common_values.dart';
import 'router/app_router.dart';

final initProvider = FutureProvider((ref) async {
  await initClient();
  await ref.watch(appIsarProvider.notifier).ensureInitialized();
  return;
});

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(initProvider).when(
          data: (data) => MaterialApp.router(
            title: 'Limer',
            routerConfig: ref.watch(appRouterProvider),
            theme: ref.watch(commonValuesProvider).theme,
            debugShowCheckedModeBanner: false,
          ),
          loading: () => Container(),
          error: (error, stack) => Container(
            color: Colors.white,
            child: Text(error.toString()),
          ),
        );
  }
}
