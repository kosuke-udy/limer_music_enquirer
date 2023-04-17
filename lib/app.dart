import 'package:beamer/beamer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'translations.g.dart';
import 'providers/db/providers.dart';
import 'ui/common_values/common_values.dart';
import 'ui/router/router_delegates.dart';

final initProvider = FutureProvider((ref) async {
  if (kDebugMode) {
    await ref.read(appIsarProvider.notifier).initialize();
  }
  return;
});

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(initProvider).when(
          data: (data) => MaterialApp.router(
            title: const String.fromEnvironment("APP_NAME"),
            routerDelegate: appRouterDelegate,
            routeInformationParser: BeamerParser(),
            backButtonDispatcher: BeamerBackButtonDispatcher(
              delegate: appRouterDelegate,
            ),
            theme: ref.watch(commonValuesProvider).theme.copyWith(
                  splashFactory: NoSplash.splashFactory,
                ),
            debugShowCheckedModeBanner: false,
            locale: !kDebugMode
                ? TranslationProvider.of(context).flutterLocale
                : const Locale("ja", "JP"),
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
          ),
          loading: () => Container(),
          error: (error, stack) => throw error,
        );
  }
}
