import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../db/schemas.dart';
import '../app_isar.dart';

part 'storefront.g.dart';

@Riverpod(keepAlive: true)
class UserStorefronts extends _$UserStorefronts {
  @override
  List<Storefront> build() {
    final appIsar = ref.watch(appIsarProvider);
    return appIsar.storefrontSettings.where().findAllSync()[0].storefronts;
  }
}
