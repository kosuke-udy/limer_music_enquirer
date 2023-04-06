import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_isar.dart';

final userMainApStorefrontProvider =
    FutureProvider.autoDispose<String>((ref) async {
  final userSettingsCollection =
      await ref.watch(userSettingsCollectionProvider.future);
  final userSettings = await userSettingsCollection.get(0);
  return userSettings!.mainStorefront!.data!.id!;
});
