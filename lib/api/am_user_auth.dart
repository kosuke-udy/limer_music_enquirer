// import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../preloader.dart';
import 'am_dev_token.dart';
import "am_native_api.pigeon.dart";

part 'am_user_auth.g.dart';

@Riverpod(keepAlive: true)
class AsyncAmUserToken extends _$AsyncAmUserToken {
  final _nativeApi = AmNativeApi();
  @override
  Future<String> build() async {
    final mockUserToken = ref.watch(preloaderProvider).amMockUserToken;
    final devToken = ref.watch(amDevTokenProvider);

    // On iOS simulator, we can't request a user token.
    // So we use a mock user token instead.
    if (mockUserToken.isNotEmpty) {
      debugPrint("Using mock user token for Apple Music");
      return mockUserToken;
    }

    // Not on iOS simulator, we can request a user token.
    return ref.watch(asyncAmUserAuthProvider).whenData((status) async {
      if (status != AmUserAuthStatus.authorized) {
        throw Exception("User is not authorized to use Apple Music");
      }

      final token = await _nativeApi.requestUserToken(devToken);
      debugPrint("Generated Apple Music User Token:");
      debugPrint(token);
      return token;
    }).value!;
  }
}

@Riverpod(keepAlive: true)
class AsyncAmUserAuth extends _$AsyncAmUserAuth {
  final _nativeApi = AmNativeApi();

  @override
  Future<AmUserAuthStatus> build() async {
    final status = await _getStatus();
    if (status == AmUserAuthStatus.notDetermined) {
      return await _requestAuth();
    }
    return status;
  }

  Future<String> _requestToken() async {
    await _requestAuth();
    final devToken = ref.watch(amDevTokenProvider);

    // On iOS simulator, we can't request a user token.
    // So we use a mock user token instead.
    final mockUserToken = ref.watch(preloaderProvider).amMockUserToken;
    if (mockUserToken.isNotEmpty) {
      debugPrint("Using mock user token for Apple Music");
      return mockUserToken;
    }

    final token = await _nativeApi.requestUserToken(devToken);
    debugPrint("Generated Apple Music User Token:");
    debugPrint(token);
    return token;
  }

  Future<AmUserAuthStatus> _requestAuth() async {
    final resultString = await _nativeApi.requestUserAuth();
    final result = AmUserAuthStatus.fromString(resultString);
    if (result != AmUserAuthStatus.authorized) {
      throw Exception("User did not authorize");
    }
    return result;
  }

  Future<AmUserAuthStatus> _getStatus() async {
    final result = await _nativeApi.getUserAuthStatus();
    return AmUserAuthStatus.fromString(result);
  }
}

enum AmUserAuthStatus {
  authorized,
  notDetermined,
  restricted,
  denied;

  static AmUserAuthStatus fromString(String value) {
    switch (value) {
      case "authorized":
        return AmUserAuthStatus.authorized;
      case "notDetermined":
        return AmUserAuthStatus.notDetermined;
      case "restricted":
        return AmUserAuthStatus.restricted;
      case "denied":
        return AmUserAuthStatus.denied;
      default:
        throw Exception("Invalid AmUserAuthStatus: $value");
    }
  }
}
