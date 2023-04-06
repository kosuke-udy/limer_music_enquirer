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

Future<String> requestUserToken(String devToken) async {
  return await AppleMusicNativeApi().requestUserToken(devToken);
}
