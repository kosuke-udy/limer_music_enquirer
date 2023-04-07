import 'package:isar/isar.dart';

import 'user_settings/ap_storefront.dart';
export 'user_settings/ap_storefront.dart';

part 'user_settings.g.dart';

@collection
class UserSettings {
  Id? id;

  ApStorefrontUserSettings? mainStorefront;
}
