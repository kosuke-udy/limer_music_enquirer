import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../app_client.dart';

export '../../../api/apple_music_api/apple_music_api.dart';

part 'album_kind.g.dart';

@riverpod
class AlbumKindDetail extends _$AlbumKindDetail {
  @override
  Future<AlbumKind> build({
    required String id,
    required String storefront,
    required languageTag,
    AlbumKind? data,
  }) async {
    if (data == null) {
      state = const AsyncValue.loading();
    } else {
      state = AsyncData(data);
    }

    final client = await ref.watch(appApClientProvider.future);
    final isCatalogs = !id.contains("i.");
    final response = isCatalogs
        ? await client.fetch<Albums>(
            "https://api.music.apple.com/v1/catalog/$storefront/albums/$id",
            queryParameters: <String, dynamic>{
              "l": languageTag,
              "include": "artists,genres,tracks,library,record-labels",
              "views":
                  "appears-on,other-versions,related-albums,related-videos",
            },
          )
        : await client.fetch<LibraryAlbums>(
            "https://api.music.apple.com/v1/me/library/albums/$id",
            queryParameters: <String, dynamic>{
              "include": "artists,catalog,tracks",
            },
          );

    return response.data[0];
  }
}
