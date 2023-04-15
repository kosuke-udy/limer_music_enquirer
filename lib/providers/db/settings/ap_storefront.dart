import 'package:isar/isar.dart';
import 'package:limer_music_enquirer/api/apple_music_api/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../db/settings/ap_storefront.dart';
import '../../apple_music/storefront/user_storefront.dart';
import '../app_isar.dart';

export '../../../db/settings/ap_storefront.dart';

part 'ap_storefront.g.dart';

@Riverpod(keepAlive: true)
class ApStorefrontSetting extends _$ApStorefrontSetting {
  @override
  Future<ApStorefrontSettingCollection> build() async {
    final list = await ref.watch(_settingsProvider.future);
    return list.last;
  }
}

@Riverpod(keepAlive: true)
class _Settings extends _$Settings {
  @override
  Future<List<ApStorefrontSettingCollection>> build() async {
    final appIsar = ref.watch(appIsarProvider);
    final list = await appIsar.apStorefrontSettingCollections.where().findAll();

    // If the list is empty, create a new one with the user's storefront.
    if (list.isEmpty) {
      final userStorefront = await ref.read(userStorefrontProvider.future);
      put(
        list: [
          ApStorefront()
            ..countryId = userStorefront.id
            ..languageTag = userStorefront.attributes!.defaultLanguageTag,
        ],
      );

      return build();
    }

    return list;
  }

  // Put a new collection into the database.
  Future<void> put({
    int? id,
    required List<ApStorefront> list,
  }) async {
    final appIsar = ref.watch(appIsarProvider);
    await appIsar.writeTxn(() async {
      if (id != null) {
        await appIsar.apStorefrontSettingCollections.delete(id);
      }
      await appIsar.apStorefrontSettingCollections.put(
        ApStorefrontSettingCollection()
          ..id = id
          ..list.addAll(list),
      );
    });
  }
}
