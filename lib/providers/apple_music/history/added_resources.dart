import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../app_client.dart';

part 'added_resources.g.dart';

@Riverpod(keepAlive: true)
class RecentlyAddedResources extends _$RecentlyAddedResources {
  @override
  Future<List<ResourceKind>> build() async {
    state = const AsyncValue.loading();

    final client = await ref.watch(appApClientProvider.future);
    return client.fetchResource(
      "https://api.music.apple.com/v1/me/recent/added",
      queryParameters: <String, dynamic>{
        "include[library-albums]": "catalog",
        "include[library-playlists]": "catalog",
      },
    );
  }
}
