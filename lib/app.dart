import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'color_schemes.dart';
import 'router/app_router.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetPlatform = Theme.of(context).platform;

    return MaterialApp.router(
      title: 'Limer',
      routerConfig: ref.watch(appRouterProvider),
      // themeMode: ThemeMode.system,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        platform: targetPlatform,
        colorScheme: ref.watch(lightColorSchemeProvider),
        typography: Typography.material2021(
          platform: targetPlatform,
          colorScheme: ref.watch(lightColorSchemeProvider),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ref.watch(darkColorSchemeProvider),
        platform: targetPlatform,
        typography: Typography.material2021(
          platform: targetPlatform,
          colorScheme: ref.watch(darkColorSchemeProvider),
        ),
      ),
    );
  }
}
