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
    try {
      final amKeyId = await rootBundle.loadString("auth/apple_music/key_id");
      final amTeamId = await rootBundle.loadString("auth/apple_music/team_id");
      final amAuthKey =
          await rootBundle.loadString("auth/apple_music/auth_key.p8");

      String amMockUserToken;
      try {
        amMockUserToken =
            await rootBundle.loadString("auth/apple_music/mock_user_token");
      } catch (e) {
        print("Can't load auth/apple_music/mock_user_token.");
        amMockUserToken = "";
      }

      return Preloads(
        amKeyId: amKeyId,
        amTeamId: amTeamId,
        amAuthKey: amAuthKey,
        amMockUserToken: amMockUserToken,
      );
    } catch (e, stack) {
      return Preloads.error(e, stack);
    }
  }
}

class Preloads {
  final String amKeyId;
  final String amTeamId;
  final String amAuthKey;
  final String amMockUserToken;

  final Object? error;
  final StackTrace? stack;
  final Exception? exception;

  Preloads({
    required this.amKeyId,
    required this.amTeamId,
    required this.amAuthKey,
    required this.amMockUserToken,
    this.error,
    this.stack,
    this.exception,
  });

  Preloads.error(this.error, this.stack)
      : amKeyId = "",
        amTeamId = "",
        amAuthKey = "",
        amMockUserToken = "",
        exception = null;

  Preloads.exception(this.exception)
      : amKeyId = "",
        amTeamId = "",
        amAuthKey = "",
        amMockUserToken = "",
        error = null,
        stack = null;
}
