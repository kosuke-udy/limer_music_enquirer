import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:limer_music_enquirer/api/type/am_user_auth_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../util/app_logger.dart';
import 'am_native_api_wrapper.dart';

part 'am_client.g.dart';

final _log = AppLogger.get("am_client.dart");

@Riverpod(keepAlive: true)
class AsyncAmClient extends _$AsyncAmClient {
  @override
  Future<Dio> build() async {
    // Get Tokens
    // devToken = await _generateDevToken();
    // userToken = await _requestUserToken(devToken);
    final devToken =
        await rootBundle.loadString("auth/apple_music/mock_dev_token");
    final userToken =
        await rootBundle.loadString("auth/apple_music/mock_user_token");
    _log.info("Using mock tokens for Apple Music API.");

    // Create dio and set options
    final dio =
        Dio(BaseOptions(baseUrl: "https://api.music.apple.com/v1/", headers: {
      "Authorization": "Bearer $devToken",
      "Music-User-Token": userToken,
    }));
    // dio.interceptors.add(LogInterceptor());

    final test = await dio.get("/me/library/songs");
    _log.fine([
      "status: ${test.statusCode}",
      "Developer Token:",
      IndentLog(devToken, indent: 1),
      "User Token:",
      IndentLog(userToken, indent: 1),
    ]);

    return dio;
  }
}

Future<String> _generateDevToken() async {
  final keyId = await rootBundle.loadString("auth/apple_music/key_id");
  final teamId = await rootBundle.loadString("auth/apple_music/team_id");
  final authKey = await rootBundle.loadString("auth/apple_music/auth_key.p8");
  final now = DateTime.now();
  final expiration = now.add(const Duration(days: 90));

  final Map<String, dynamic> header = {
    "alg": "ES256",
    "kid": keyId,
  };

  final Map<String, dynamic> payload = {
    "iss": teamId,
    "iat": _dateTimeToEpochSec(now),
    "exp": _dateTimeToEpochSec(expiration),
  };

  final result = JWT(payload, header: header).sign(
    ECPrivateKey(authKey),
    algorithm: JWTAlgorithm.ES256,
    noIssueAt: true,
  );

  return result;
}

int _dateTimeToEpochSec(DateTime dateTime) {
  return dateTime.millisecondsSinceEpoch ~/ 1000;
}

// Fetch user token from native API.
// If the mock exists in auth/apple_music folder, use it instead.
// NOTICE:
//   On iOS simulator, API fetching will fail.
//   In that case, place the mock at auth/apple_music/mock_user_token.
Future<String> _requestUserToken(String devToken) async {
  final native = AmNativeApiWrapper();
  final status = await native.getUserAuthStatus();

  _log.info("Apple Music User Authorization Status: $status");

  if (status != AmUserAuthStatus.authorized) {
    if (status == AmUserAuthStatus.notDetermined) {
      _log.info("Requesting Apple Music User Authorization...");

      final reqResponse = await native.requestUserAuth();
      if (reqResponse != AmUserAuthStatus.authorized) {
        throw reqResponse.toException();
      }
    } else {
      throw status.toException();
    }
  }

  _log.info("Requesting Apple Music User Token...");

  return await native.requestUserToken(devToken);
}
