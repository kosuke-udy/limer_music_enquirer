import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../api/apple_music_api/apple_music_api.dart';

part 'songs.g.dart';

@Riverpod(keepAlive: true)
class RecentlyPlayedSongs extends _$RecentlyPlayedSongs {
  final _client = AppleMusicApiClient();

  @override
  Future<List<SongKind>> build() {
    state = const AsyncValue.loading();
    return fetch();
  }

  Future<List<SongKind>> fetch() async {
    return _client.fetch(
      "https://api.music.apple.com/v1/me/recent/played/tracks",
      queryParameters: <String, dynamic>{
        "l": "",
        "limit": 30,
        "offset": "",
        "types": "songs,library-songs",
        "include[library-songs]": "catalog",
      },
    );
  }
}
