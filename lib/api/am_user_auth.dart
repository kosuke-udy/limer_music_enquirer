import 'package:riverpod_annotation/riverpod_annotation.dart';

import "am_native_api.pigeon.dart";

part 'am_user_auth.g.dart';

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
