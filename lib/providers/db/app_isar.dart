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
    final instance = Isar.openSync(
      [
        ApStorefrontSettingCollectionSchema,
        ApSongMetadataSettingCollectionSchema,
      ],
      directory: directory.path,
    );

    await instance.writeTxn(
      () async {
        if (const String.fromEnvironment("FLAVOR") == "dev") {
          await instance.clear();
        }
      },
    );

    return instance;
  }
}
