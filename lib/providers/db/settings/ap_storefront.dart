import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../app_isar.dart';

part 'ap_storefront.g.dart';

@Riverpod(keepAlive: true)
class UserMainApStorefront extends _$UserMainApStorefront {
  @override
  Future<String> build() async {
    final userSettingsCollection =
        await ref.watch(userSettingsCollectionProvider.future);
    final userSettings = await userSettingsCollection.get(0);
    return userSettings!.mainStorefront!.data!.id!;
  }
}
