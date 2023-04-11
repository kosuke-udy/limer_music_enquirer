import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../db/settings/storefront.dart';
export '../../../db/settings/storefront.dart';
import '../app_isar.dart';

part 'metadata_locales.g.dart';

@Riverpod(keepAlive: true)
class MetadataLocales extends _$MetadataLocales {
  @override
  Future<List<MetadataLocale>> build() async {
    final appIsar = ref.watch(appIsarProvider);
    return appIsar.metadataLocaleSettings
        .where()
        .findAll()
        .then((value) => value[0].list);
  }
}
