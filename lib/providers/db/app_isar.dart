import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../api/apple_music_api/apple_music_api.dart';
import '../../db/schemas.dart';

part 'app_isar.g.dart';

@Riverpod(keepAlive: true)
class AppIsar extends _$AppIsar {
  static final _isar = Isar.openSync(
      [MetadataLocaleSettingSchema, MetadataDisplaySettingsSchema]);
  bool _isInitialized = false;

  @override
  Isar build() {
    return _isar;
  }

  Future<void> ensureInitialized() async {
    if (_isInitialized) return;

    final allUserMetadataLocales =
        await _isar.metadataLocaleSettings.where().findAll();
    if (allUserMetadataLocales.isEmpty || kDebugMode) {
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
      await _isar.clear();

      await _isar.metadataDisplaySettings.put(MetadataDisplaySettings());

      await _isar.metadataLocaleSettings.put(MetadataLocaleSetting()
        ..list.add(
          MetadataLocale()
            ..countryCode = userStorefront.id
            ..languageCode = userStorefront.attributes!.defaultLanguageTag,
        ));

      if (const String.fromEnvironment("flavor") == "dev") {
        await _isar.metadataLocaleSettings.put(MetadataLocaleSetting()
          ..list.add(
            MetadataLocale()
              ..countryCode = "us"
              ..languageCode = "en-US",
          ));
      }
    });
  }
}
