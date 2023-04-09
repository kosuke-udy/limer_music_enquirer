import 'package:isar/isar.dart';

part 'metadata_locale.g.dart';

@collection
class MetadataLocaleSetting {
  Id? id;

  List<MetadataLocale> list = [];

  @ignore
  get main => list.first;
}

@embedded
class MetadataLocale {
  String countryCode = "";
  String languageCode = "";
}
