import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import '../util/app_logger.dart';

void main() {
  AppLogger.init();

  final logger = AppLogger.get("main.dart");

  final osName = Platform.operatingSystem;
  logger.info("Running on $osName");

  runApp(const ProviderScope(child: App()));
}
