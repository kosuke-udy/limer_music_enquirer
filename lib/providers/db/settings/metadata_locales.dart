import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../db/schemas.dart';
import '../app_isar.dart';

part 'metadata_locales.g.dart';

@Riverpod(keepAlive: true)
class UserMetadataLocales extends _$UserMetadataLocales {
  @override
  List<MetadataLocale> build() {
    final appIsar = ref.watch(appIsarProvider);
    return appIsar.metadataLocaleSettings.where().findAllSync()[0].list;
  }
}
