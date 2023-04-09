import 'package:flutter/material.dart';
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
  MetadataLocale();

  String countryCode = "";
  String languageCode = "";

  Locale toLocale() => Locale(languageCode, countryCode.toUpperCase());
}
