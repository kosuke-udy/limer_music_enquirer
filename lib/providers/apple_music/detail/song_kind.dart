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

    final result = await _client.fetchResource<SongKind>(
      "https://api.music.apple.com/v1/catalog/$storefront/songs/$id",
      queryParameters: <String, dynamic>{
        "l": languageTag,
        "include": "albums,artists,composers,library",
      },
    );
    state = AsyncData(result[0]);
    return result[0];
  }
}
