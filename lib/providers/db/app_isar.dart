import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../api/apple_music_api/apple_music_api.dart';
import '../../db/schemas.dart';

part 'app_isar.g.dart';

@Riverpod(keepAlive: true)
class AppIsar extends _$AppIsar {
  static final _isar =
      Isar.openSync([StorefrontSettingsSchema, DisplayMetadataSettingsSchema]);
  bool _isInitialized = false;

  @override
  Isar build() {
    if (!_isInitialized) {
      ensureInitialized();
    }
    return _isar;
  }

  Future<void> ensureInitialized() async {
    final allStorefronts = await _isar.storefrontSettings.where().findAll();

    if (allStorefronts.isEmpty) {
      init();
    }

    _isInitialized = true;
  }

// Initialize the database when first used.
  Future<void> init() async {
    final response = await AppleMusicApiClient().fetch(
      "https://api.music.apple.com/v1/me/storefront",
    );
    final userStorefront = Storefronts.fromJson(response[0]);

    await _isar.writeTxn(() async {
      _isar.clear();

      _isar.displayMetadataSettings.put(DisplayMetadataSettings());

      _isar.storefrontSettings.put(StorefrontSettings()
        ..storefronts.add(
          Storefront()
            ..country = userStorefront.id
            ..language = userStorefront.attributes!.defaultLanguageTag,
        ));

      if (kDebugMode) {
        print(0);
        _isar.storefrontSettings.put(StorefrontSettings()
          ..storefronts.add(
            Storefront()
              ..country = "us"
              ..language = "en-US",
          ));
      }
    });
  }
}
