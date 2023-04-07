import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../api/apple_music_api/apple_music_api.dart';
import '../../db/settings/ap_storefront.dart';

part 'song_kind.g.dart';

@riverpod
class SongKindDetail extends _$SongKindDetail {
  final _client = AppleMusicApiClient();

  @override
  Future<SongKind> build(
    String id, {
    SongKind? data,
    String? storefront,
  }) async {
    if (data == null) {
      state = const AsyncValue.loading();
    } else {
      state = AsyncData(data);
    }
    return await _fetch(
      id,
      storefront ?? await ref.watch(userMainApStorefrontProvider.future),
    );
  }

  Future<SongKind> _fetch(String id, String storefront) async {
    final result = await _client.fetch<SongKind>(
      "https://api.music.apple.com/v1/catalog/$storefront/songs/$id",
      queryParameters: <String, dynamic>{
        "include": "albums,artists,composers,library",
      },
    );
    return result[0];
  }
}
