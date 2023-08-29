import 'package:fpdart/fpdart.dart';

import '../../../utils/app_logger.dart';
import 'apple_music_native_api.pigeon.dart';
import 'user_auth_status.dart';

Future<UserAuthStatus> getUserAuthStatus() async {
  final result = UserAuthStatus.fromString(
      await AppleMusicNativeApi().getUserAuthStatus());
  return result;
}

Future<UserAuthStatus> requestUserAuth() async {
  final result =
      UserAuthStatus.fromString(await AppleMusicNativeApi().requestUserAuth());
  return result;
}

Future<Either<UserAuthStatus, String>> requestUserToken(String devToken) async {
  final logger = AppLogger.get("requestUserToken");
  final authStatus = await getUserAuthStatus();
  final tokenTask = Task<String>(() async {
    final userToken = await AppleMusicNativeApi().requestUserToken(devToken);
    logger.fine([
      "Developer Token:",
      devToken,
      "User Token:",
      userToken,
    ]);
    return userToken;
  });

  logger.fine("User authorization status of Apple Music API: $authStatus");

  switch (authStatus) {
    case UserAuthStatus.authorized:
      return Either.of(await tokenTask.run());
    case UserAuthStatus.notDetermined:
      logger.fine("Requesting user auth");
      if (await requestUserAuth() == UserAuthStatus.authorized) {
        return Either.of(await tokenTask.run());
      } else {
        logger.warning("User denied authorization");
        return Either.left(UserAuthStatus.denied);
      }
    default:
      logger.warning("User denied authorization");
      return Either.left(UserAuthStatus.denied);
  }
}
