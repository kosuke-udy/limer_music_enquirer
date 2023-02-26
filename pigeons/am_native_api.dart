import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class AmNativeApi {
  String getUserAuthStatus();

  @async
  String requestUserAuth();
}
