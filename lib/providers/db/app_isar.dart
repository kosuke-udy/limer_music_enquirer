import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../db/schemas.dart';

part 'app_isar.g.dart';

@Riverpod(keepAlive: true)
class AppIsar extends _$AppIsar {
  static final _isar = Isar.openSync([
    ApStorefrontSettingCollectionSchema,
    ApSongMetadataSettingCollectionSchema,
  ]);

  @override
  Isar build() {
    return _isar;
  }

  // Initialize the database
  Future<void> initialize() async {
    await _isar.writeTxn(() => _isar.clear());
  }
}
