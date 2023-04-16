import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../app_client.dart';

part 'user_storefront.g.dart';

@riverpod
class UserStorefront extends _$UserStorefront {
  @override
  Future<Storefronts> build() async {
    state = const AsyncValue.loading();
    final client = await ref.watch(appApClientProvider.future);
    final response = await client.fetch<Storefronts>(
      "https://api.music.apple.com/v1/me/storefront",
    );
    return response.data[0];
  }
}
