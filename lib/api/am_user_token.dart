import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../preloader.dart';
import 'am_dev_token.dart';
import "am_native_api.pigeon.dart";
import 'am_user_auth.dart';

part 'am_user_token.g.dart';

@Riverpod(keepAlive: true)
class AsyncAmUserToken extends _$AsyncAmUserToken {
  final _nativeApi = AmNativeApi();

  @override
  Future<String> build() async {
    // On iOS simulator, we can't request a user token.
    // So we use a mock user token instead.
    final mockUserToken = ref.watch(preloaderProvider).amMockUserToken;
    if (mockUserToken.isNotEmpty) {
      debugPrint("Using mock user token for Apple Music");
      return mockUserToken;
    }

    // Not on iOS simulator, we can request a user token.
    final devToken = ref.watch(amDevTokenProvider);
    final authStatus = ref.watch(asyncAmUserAuthProvider);
    authStatus.when(
      data: (status) async {
        if (status != AmUserAuthStatus.authorized) {
          throw Exception("User is not authorized to use Apple Music");
        }
      },
      loading: () => throw Exception("User auth status is loading"),
      error: (error, stackTrace) => throw Exception("User auth status error"),
    );

    final token = await _nativeApi.requestUserToken(devToken);
    debugPrint("Generated Apple Music User Token:");
    debugPrint(token);
    return token;
  }
}
