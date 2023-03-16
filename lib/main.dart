import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/app_logger.dart';
import 'app.dart';

void main() {
  AppLogger.init();

  final logger = AppLogger.get("main.dart");

  final osName = Platform.operatingSystem;
  logger.info("Running on $osName");

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
