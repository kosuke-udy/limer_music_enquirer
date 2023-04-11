import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../db/settings/storefront.dart';
export '../../../db/settings/storefront.dart';
import '../app_isar.dart';

part 'ap_storefront.g.dart';

@Riverpod(keepAlive: true)
class ApStorefrontSetting extends _$ApStorefrontSetting {
  @override
  Future<List<ApStorefront>> build() async {
    final appIsar = ref.watch(appIsarProvider);
    return appIsar.apStorefrontSettingCollections
        .where()
        .findAll()
        .then((value) => value[0].list);
  }
}
