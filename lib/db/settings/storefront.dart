import 'package:isar/isar.dart';

part 'storefront.g.dart';

@collection
class ApStorefrontSettingCollection {
  Id? id;

  List<ApStorefront> list = [];
}

@embedded
class ApStorefront {
  ApStorefront();

  String countryId = "";
  String languageTag = "";
}
