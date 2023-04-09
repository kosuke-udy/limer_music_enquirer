import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/apple_music/init_client.dart';
import 'providers/db/providers.dart';
import 'ui/common_values/common_values.dart';
import 'router/app_router.dart';

final initProvider = FutureProvider((ref) async {
  await initAppleMusicApiClient();

  // Always after initAppleMusicApiClient()
  await ref.watch(appIsarProvider.notifier).ensureInitialized();

  return;
});

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(initProvider).when(
          data: (data) => MaterialApp.router(
            title: const String.fromEnvironment("APP_NAME"),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ja', 'JP'),
            ],
            theme: ref.watch(commonValuesProvider).theme.copyWith(
                  splashFactory: NoSplash.splashFactory,
                ),
            routerConfig: ref.watch(appRouterProvider),
          ),
          loading: () => Container(),
          error: (error, stack) => Container(
            color: Colors.white,
            child: Text(error.toString()),
          ),
        );
  }
}
