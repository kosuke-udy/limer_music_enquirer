import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../app_client.dart';

part 'song_kind.g.dart';

@riverpod
class SongKindDetail extends _$SongKindDetail {
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

    final client = await ref.watch(appApClientProvider.future);
    final isCatalogs = !id.contains("i.");
    final response = isCatalogs
        ? await client.fetch<Songs>(
            "https://api.music.apple.com/v1/catalog/$storefront/songs/$id",
            queryParameters: <String, dynamic>{
              "l": languageTag,
              "include": "albums,artists,composers,library",
            },
          )
        : await client.fetch<LibrarySongs>(
            "https://api.music.apple.com/v1/me/library/songs/$id",
            queryParameters: <String, dynamic>{
              "include": "albums,artists,catalog",
            },
          );

    return response.data[0];
  }
}
