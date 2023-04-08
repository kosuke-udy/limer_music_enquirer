// part of apple_music_providers;

// final recentlyPlayedResourcesProvider =
//     FutureProvider.autoDispose<List<ResourceKind>>((ref) async {
//   return await _client.fetchResource(
//     "https://api.music.apple.com/v1/me/recent/played",
//     queryParameters: <String, dynamic>{
//       "include": 'albums,library-albums',
//       "include[library-albums]": "catalog",
//     },
//   );
// });
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../api/apple_music_api/apple_music_api.dart';

part 'resources.g.dart';

@Riverpod(keepAlive: true)
class RecentlyPlayedResources extends _$RecentlyPlayedResources {
  final _client = AppleMusicApiClient();

  @override
  Future<List<ResourceKind>> build() {
    state = const AsyncValue.loading();
    return fetch();
  }

  Future<List<ResourceKind>> fetch() async {
    return _client.fetchResource(
      "https://api.music.apple.com/v1/me/recent/played",
      queryParameters: <String, dynamic>{
        "include": 'albums,library-albums',
        "include[library-albums]": "catalog",
      },
    );
  }
}
