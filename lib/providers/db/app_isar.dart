import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../db/schemas.dart';

part 'app_isar.g.dart';

@Riverpod(keepAlive: true)
class AppIsar extends _$AppIsar {
  @override
  Future<Isar> build() async {
    final directory = await getApplicationSupportDirectory();
    return Isar.openSync(
      [
        ApStorefrontSettingCollectionSchema,
        ApSongMetadataSettingCollectionSchema,
      ],
      directory: directory.path,
    );
  }

  // Initialize the database
  Future<void> initialize() async {
    final appIsar = await ref.watch(appIsarProvider.future);
    await appIsar.writeTxn(() => appIsar.clear());
    state = AsyncValue.data(appIsar);
  }
}
