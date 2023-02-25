import 'dart:async';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preloader.g.dart';

@Riverpod(keepAlive: true)
Preloads preloader(PreloaderRef ref) {
  return ref.watch(asyncPreloaderProvider).when(
      data: (preloads) => preloads,
      loading: () => Preloads.exception(Exception("Preloader is loading")),
      error: (error, stackTrace) => Preloads.error(error, stackTrace));
}

@Riverpod(keepAlive: true)
class AsyncPreloader extends _$AsyncPreloader {
  @override
  Future<Preloads> build() async {
    final kid = await rootBundle.loadString("auth/apple_music/key_id");
    final iss = await rootBundle.loadString("auth/apple_music/team_id");
    final authKey = await rootBundle.loadString("auth/apple_music/auth_key.p8");

    return Preloads(kid, iss, authKey);
  }
}

class Preloads {
  final String kid;
  final String iss;
  final String authKey;
  final Object? error;
  final StackTrace? stack;
  final Exception? exception;

  Preloads(
    this.kid,
    this.iss,
    this.authKey, {
    this.error,
    this.stack,
    this.exception,
  });

  Preloads.error(this.error, this.stack)
      : kid = "",
        iss = "",
        authKey = "",
        exception = null;

  Preloads.exception(this.exception)
      : kid = "",
        iss = "",
        authKey = "",
        error = null,
        stack = null;
}
