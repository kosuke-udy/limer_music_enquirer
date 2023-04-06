import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

import '../../db/user_settings.dart';
export '../../db/user_settings.dart';

final appIsarProvider =
    FutureProvider((ref) => Isar.open([UserSettingsSchema]));

final userSettingsCollectionProvider = FutureProvider((ref) async {
  final isar = await ref.watch(appIsarProvider.future);
  return isar.userSettings;
});
