import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'translations.g.dart';
import 'utils/app_logger.dart';
import 'app.dart';

void main() {
  // Ensure that the binding is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the logger.
  AppLogger.init();
  final logger = AppLogger.get("main.dart");

  // Log some information about the environment.
  logger.info([
    "Locale: ${Platform.localeName}",
    "Running on ${Platform.operatingSystem}",
    "Running in ${const String.fromEnvironment("FLAVOR")} flavor",
  ]);

  LocaleSettings.useDeviceLocale();

  runApp(
    ProviderScope(
      child: TranslationProvider(
        child: const App(),
      ),
    ),
  );
}
