import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../api/apple_music_api/apple_music_api.dart';

part 'all_storefronts.g.dart';

@riverpod
class AllStorefronts extends _$AllStorefronts {
  final _client = AppleMusicApiClient();

  @override
  Future<List<Storefronts>> build() async {
    state = const AsyncValue.loading();
    return await _fetch();
  }

  Future<List<Storefronts>> _fetch() async {
    final response = await _client.fetch(
      "https://api.music.apple.com/v1/storefronts",
    );
    return response.map((e) => Storefronts.fromJson(e)).toList(growable: false);
  }
}
