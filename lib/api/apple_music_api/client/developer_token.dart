part of client;

String generateDeveloperToken({
  required String keyId,
  required String teamId,
  required String authKey,
}) {
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
