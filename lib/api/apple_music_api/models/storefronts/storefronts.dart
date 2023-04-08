import 'package:freezed_annotation/freezed_annotation.dart';

import '../util_types.dart';
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
