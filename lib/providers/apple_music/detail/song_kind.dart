import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../api/apple_music_api/apple_music_api.dart';

part 'song_kind.g.dart';

@riverpod
class SongKindDetail extends _$SongKindDetail {
  final _client = AppleMusicApiClient();

  @override
  Future<SongKind> build({
    required String id,
    required String storefront,
    required languageTag,
    SongKind? data,
  }) async {
    if (data == null) {
      state = const AsyncValue.loading();
    } else {
      state = AsyncData(data);
    }

    final isCatalogs = !id.contains("i.");
    final result = isCatalogs
        ? await _client.fetchResource<Songs>(
            "https://api.music.apple.com/v1/catalog/$storefront/songs/$id",
            queryParameters: <String, dynamic>{
              "l": languageTag,
              "include": "albums,artists,composers,library",
            },
          )
        : await _client.fetchResource<LibrarySongs>(
            "https://api.music.apple.com/v1/me/library/songs/$id",
            queryParameters: <String, dynamic>{
              "include": "albums,artists,catalog",
            },
          );

    state = AsyncData(result[0]);
    return result[0];
  }
}
