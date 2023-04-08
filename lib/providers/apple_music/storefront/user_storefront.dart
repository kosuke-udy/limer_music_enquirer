import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../api/apple_music_api/apple_music_api.dart';

part 'user_storefront.g.dart';

@riverpod
class UserStorefront extends _$UserStorefront {
  final _client = AppleMusicApiClient();

  @override
  Future<Storefronts> build() async {
    state = const AsyncValue.loading();
    return await _fetch();
  }

  Future<Storefronts> _fetch() async {
    final response = await _client.fetch(
      "https://api.music.apple.com/v1/me/storefront",
    );
    return Storefronts.fromJson(response[0]);
  }
}
