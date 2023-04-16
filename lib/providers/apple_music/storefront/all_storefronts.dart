import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../app_client.dart';

part 'all_storefronts.g.dart';

@riverpod
class AllStorefronts extends _$AllStorefronts {
  @override
  Future<List<Storefronts>> build() async {
    state = const AsyncValue.loading();

    final client = await ref.watch(appApClientProvider.future);
    final response = await client.fetch<Storefronts>(
      "https://api.music.apple.com/v1/storefronts",
    );
    return response.data;
  }
}
