import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../abstracts_base.dart';
import 'storefronts_attributes.dart';

part 'storefronts.freezed.dart';

@freezed
class Storefronts with _$Storefronts implements ResourceKind {
  const factory Storefronts({
    required String id,
    required ResourceType type,
    StorefrontsAttributes? attributes,
  }) = _Storefronts;

  factory Storefronts.fromJson(Map<String, dynamic> json) {
    return Storefronts(
      id: json["id"],
      type: ResourceType.fromJson(json["type"]),
      attributes: json["attributes"] != null
          ? StorefrontsAttributes.fromJson(json["attributes"])
          : null,
    );
  }
}

extension StorefrontsExtension on Storefronts {
  List<Locale> getLocales() {
    return attributes!.supportedLanguageTags.map((tag) {
      return _getLocale(tag);
    }).toList();
  }

  Locale getDefaultLocale() {
    return _getLocale(attributes!.defaultLanguageTag);
  }

  Locale _getLocale(String tag) {
    if (tag.contains("-")) {
      final split = tag.split("-");
      return Locale(split[0], split[1]);
    } else {
      return Locale(id, tag);
    }
  }
}
