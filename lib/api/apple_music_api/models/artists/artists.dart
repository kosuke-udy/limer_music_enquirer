import 'package:freezed_annotation/freezed_annotation.dart';

import '../base_abstracts.dart';
import 'artists_attributes.dart';
import 'artists_relationships.dart';
import 'artists_views.dart';

part 'artists.freezed.dart';

@freezed
class Artists with _$Artists implements ArtistKind {
  const factory Artists({
    required String id,
    required ResourceType type,
    required String href,
    ArtistsAttributes? attributes,
    ArtistsRelationships? relationships,
    ArtistsViews? views,
  }) = _Artists;

  factory Artists.fromJson(Map<String, dynamic> json) {
    return Artists(
      id: json["id"],
      type: ResourceType.fromJson(json["type"]),
      href: json["href"],
      attributes: json["attributes"] != null
          ? ArtistsAttributes.fromJson(json["attributes"])
          : null,
      relationships: json["relationships"] != null
          ? ArtistsRelationships.fromJson(json["relationships"])
          : null,
      views:
          json["views"] != null ? ArtistsViews.fromJson(json["views"]) : null,
    );
  }
}
