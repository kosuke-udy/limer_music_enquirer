import 'package:isar/isar.dart';

part 'storefront.g.dart';

@collection
class StorefrontSettings {
  Id? id;

  List<Storefront> storefronts = [];

  @ignore
  get mainStorefront => storefronts.first;
}

@embedded
class Storefront {
  String country = "";
  String language = "";
}
