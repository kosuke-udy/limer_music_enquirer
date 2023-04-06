import 'package:pigeon/pigeon.dart';

class LibraryTrackData {
  late bool succeeded;
  late String? errorMessage;

  late String id;

  late String? composerName;
  late int? lastPlayedDate;
  late int libraryAddedDate;
  late int playCount;
}

@HostApi()
abstract class AppleMusicNativeApi {
  String getUserAuthStatus();

  @async
  String requestUserAuth();

  @async
  String requestUserToken(String devToken);

  @async
  List<LibraryTrackData> fetchMultipleLibraryTrackData(List<String> ids);
}
