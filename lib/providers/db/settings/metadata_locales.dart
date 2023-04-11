import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../db/settings/metadata_locale.dart';
export '../../../db/settings/metadata_locale.dart';
import '../app_isar.dart';

part 'metadata_locales.g.dart';

@Riverpod(keepAlive: true)
class MetadataLocales extends _$MetadataLocales {
  @override
  List<MetadataLocale> build() {
    final appIsar = ref.watch(appIsarProvider);
    return appIsar.metadataLocaleSettings.where().findAllSync()[0].list;
  }
}
