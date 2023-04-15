import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../api/apple_music_api/apple_music_api.dart';

part 'resources.g.dart';

@Riverpod(keepAlive: true)
class RecentlyPlayedResources extends _$RecentlyPlayedResources {
  final _client = AppleMusicApiClient();

  @override
  Future<List<ResourceKind>> build() {
    state = const AsyncValue.loading();
    return _client.fetchResource(
      "https://api.music.apple.com/v1/me/recent/played",
      queryParameters: <String, dynamic>{
        "include[library-albums]": "catalog",
        "include[library-playlists]": "catalog",
      },
    );
  }
}
