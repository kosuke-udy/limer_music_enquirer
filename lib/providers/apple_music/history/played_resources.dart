import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../app_client.dart';

part 'played_resources.g.dart';

@Riverpod(keepAlive: true)
class RecentlyPlayedResources extends _$RecentlyPlayedResources {
  @override
  Future<List<ResourceKind>> build() async {
    state = const AsyncValue.loading();

    final client = await ref.watch(appApClientProvider.future);
    final response = await client.fetch<ResourceKind>(
      "https://api.music.apple.com/v1/me/recent/played",
      queryParameters: <String, dynamic>{
        "include[library-albums]": "catalog",
        "include[library-playlists]": "catalog",
      },
    );
    return response.data;
  }
}
