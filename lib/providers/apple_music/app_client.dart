import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/services.dart';

import '../../api/apple_music_api/apple_music_api.dart';
import '../../utils/app_logger.dart';

export '../../api/apple_music_api/apple_music_api.dart';

part 'app_client.g.dart';

@Riverpod(keepAlive: true)
class AppApClient extends _$AppApClient {
  final _client = AppleMusicApiClient();

  @override
  Future<AppleMusicApiClient> build() async {
    state = const AsyncValue.loading();
    if (!_client.isInitialized) {
      await init();
    }
    return _client;
  }

  Future<void> init() async {
    // Get Tokens
    final (devToken, userToken) = await getTokens();

    // Initialize Client
    _client.initialize(
      devToken: devToken,
      userToken: userToken,
      queryParameters: {
        "extend[songs]": "artistUrl,audioVariants",
      },
      logEnabled: true,
      logger: (response) => AppLogger.get("AppleMusicApiClient").info([
        "Request: ${response.requestOptions.method} ${response.requestOptions.path}",
        "Response Status: ${response.statusCode} ${response.statusMessage}",
      ]),
    );
  }

  Future<(String, String)> getTokens() async {
    if (const bool.fromEnvironment("USE_MOCK_TOKENS")) {
      return (
        await rootBundle.loadString("auth/apple_music/mock_dev_token"),
        await rootBundle.loadString("auth/apple_music/mock_user_token"),
      );
    } else {
      final devToken = generateDeveloperToken(
        keyId: await rootBundle.loadString("auth/apple_music/key_id"),
        teamId: await rootBundle.loadString("auth/apple_music/team_id"),
        authKey: await rootBundle.loadString("auth/apple_music/auth_key.p8"),
      );
      final userToken = (await requestUserToken(devToken))
          .getOrElse((l) => throw l.toException());
      return (devToken, userToken);
    }
  }
}
