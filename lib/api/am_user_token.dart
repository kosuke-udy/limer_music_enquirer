// import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import "am_native_api.pigeon.dart";

part 'am_user_token.g.dart';

@Riverpod(keepAlive: true)
class AsyncAmUserAuth extends _$AsyncAmUserAuth {
  final _nativeApi = AmNativeApi();

  @override
  Future<AmUserAuthStatus> build() async {
    final result = await _nativeApi.getUserAuthStatus();
    return AmUserAuthStatus.fromString(result);
  }

  Future<AmUserAuthStatus> requestAuth() async {
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
