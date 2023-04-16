import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../app_client.dart';

part 'played_songs.g.dart';

@Riverpod(keepAlive: true)
class RecentlyPlayedSongs extends _$RecentlyPlayedSongs {
  @override
  Future<List<SongKind>> build() async {
    state = const AsyncValue.loading();

    final client = await ref.watch(appApClientProvider.future);
    final response = await client.fetch<SongKind>(
      "https://api.music.apple.com/v1/me/recent/played/tracks",
      queryParameters: <String, dynamic>{
        "l": "",
        "limit": 30,
        "offset": "",
        "types": "songs,library-songs",
        "include[library-songs]": "catalog",
        "include[songs]": "albums,artists,composers,library",
      },
    );
    return response.data;
  }
}
