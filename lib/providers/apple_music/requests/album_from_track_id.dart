part of apple_music_providers;

final albumKindFromTrackIdFamily =
    FutureProvider.autoDispose.family<AlbumKind, String>(
  (ref, trackId) async {
    final storefront = await ref.watch(userMainApStorefrontProvider.future);
    final result = trackId.substring(0, 1) == "i."
        ? await _client.fetch<AlbumKind>(
            "https://api.music.apple.com/v1/me/library/songs/$trackId/albums",
            queryParameters: {
              "l": "",
              "include[songs]": "albums,library,tracks,record-labels",
              "views[songs]":
                  "appears-on,other-versions,related-albums,related-videos",
              "include[library-songs]": "albums,catalog,tracks",
            },
          )
        : await _client.fetch<AlbumKind>(
            "https://api.music.apple.com/v1/catalog/$storefront/songs/$trackId/albums",
            queryParameters: {
              "l": "",
              "include[albums]": "albums,library,tracks,record-labels",
              "views[alubms]":
                  "appears-on,other-versions,related-albums,related-videos",
              "include[library-albums]": "albums,catalog,tracks",
            },
          );
    return result[0];
  },
);
