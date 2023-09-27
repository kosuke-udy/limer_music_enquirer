import 'package:beamer/beamer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:flutter_localizations/flutter_localizations.dart';
=======
<<<<<<< Updated upstream
>>>>>>> Stashed changes
import 'package:hooks_riverpod/hooks_riverpod.dart';
=======
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> Stashed changes

import 'translations.g.dart';
import 'ui/common_values/common_values.dart';
import 'ui/router/router_delegates.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
<<<<<<< Updated upstream
      title: const String.fromEnvironment("APP_NAME"),
      routerDelegate: appRouterDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: backButtonDispatcher,
=======
<<<<<<< Updated upstream
      title: 'Limer',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: ref.watch(appRouterProvider),
=======
      title: const String.fromEnvironment("APP_NAME"),
      routerDelegate: appRouterDelegate,
      routeInformationParser: BeamerParser(),
>>>>>>> Stashed changes
      theme: ref.watch(commonValuesProvider).theme.copyWith(
            splashFactory: NoSplash.splashFactory,
          ),
      debugShowCheckedModeBanner: false,
      locale: !kDebugMode
          ? TranslationProvider.of(context).flutterLocale
          : const Locale("ja", "JP"),
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
<<<<<<< Updated upstream
=======
>>>>>>> Stashed changes
>>>>>>> Stashed changes
    );
  }
}
