import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/app_logger.dart';
import 'app.dart';

void main() {
  AppLogger.init();

  final logger = AppLogger.get("main.dart");

  // Log the operating system.
  final osName = Platform.operatingSystem;
  logger.info("Running on $osName");

  // Log the flavor.
  const flavor = String.fromEnvironment("FLAVOR");
  logger.info("Running in $flavor flavor");

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
