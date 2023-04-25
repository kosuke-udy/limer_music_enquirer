import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../app_client.dart';

part 'added_resources.g.dart';

@Riverpod(keepAlive: true)
class RecentlyAddedResources extends _$RecentlyAddedResources {
  int? _nextOffset = 0;

  @override
  Future<List<ResourceKind>> build() async {
    return _fetchUnits();
  }

  Future<List<ResourceKind>> _fetchUnits({int unitCount = 2}) async {
    final results = <ResourceKind>[];
    for (int i = 0; i < unitCount; i++) {
      if (_nextOffset == null) {
        break;
      }
      results.addAll(await _fetch());
    }
    return results;
  }

  Future<List<ResourceKind>> _fetch() async {
    if (_nextOffset == null) return [];

    final client = await ref.watch(appApClientProvider.future);
    final response = await client.fetch<ResourceKind>(
      "https://api.music.apple.com/v1/me/library/recently-added",
      queryParameters: <String, dynamic>{
        "include[library-albums]": "catalog",
        "include[library-playlists]": "catalog",
        "offset": _nextOffset,
      },
    );
    _nextOffset = int.tryParse(
        Uri.tryParse(response.next ?? "")?.queryParameters["offset"] ?? "");
    return response.data;
  }
}
