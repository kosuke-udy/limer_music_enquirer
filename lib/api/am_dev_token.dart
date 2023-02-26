import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../preloader.dart';

part 'am_dev_token.g.dart';

@Riverpod(keepAlive: true)
class AmDevToken extends _$AmDevToken {
  @override
  String build() {
    return _generateToken();
  }

  void refresh() {
    state = _generateToken();
  }

  String _generateToken() {
    final preloads = ref.watch(preloaderProvider);
    final now = DateTime.now();
    final expiration = now.add(const Duration(days: 3));

    final Map<String, dynamic> header = {
      "alg": "ES256",
      "kid": preloads.amKeyId,
    };

    final Map<String, dynamic> payload = {
      "iss": preloads.amTeamId,
      "iat": dateTimeToEpochSec(now),
      "exp": dateTimeToEpochSec(expiration),
    };

    return JWT(payload, header: header).sign(
      ECPrivateKey(preloads.amAuthKey),
      algorithm: JWTAlgorithm.ES256,
      noIssueAt: true,
    );
  }

  int dateTimeToEpochSec(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch ~/ 1000;
  }
}
