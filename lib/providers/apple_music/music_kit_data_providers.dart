import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api/apple_music_api/apple_music_api.dart';

final musicKitTrackDataListProviderFamily =
    FutureProvider.family.autoDispose<List<LibraryTrackData>, List<String>>(
  (ref, ids) async {
    final musicKitApi = AppleMusicNativeApi();
    final response = await musicKitApi.fetchMultipleLibraryTrackData(ids);
    return response.cast();
  },
);
