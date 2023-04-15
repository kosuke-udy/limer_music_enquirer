import 'package:freezed_annotation/freezed_annotation.dart';

import '../abstracts_base.dart';
import 'albums_attributes.dart';
import 'albums_relationships.dart';
import 'albums_views.dart';

part 'albums.freezed.dart';

@freezed
class Albums with _$Albums implements AlbumKind {
  const factory Albums({
    required String id,
    required ResourceType type,
    String? href,
    AlbumsAttributes? attributes,
    AlbumsRelationships? relationships,
    AlbumsViews? views,
  }) = _Albums;

  factory Albums.fromJson(Map<String, dynamic> json) {
    return Albums(
      id: json["id"],
      type: ResourceType.fromJson(json["type"]),
      href: json["href"],
      attributes: json["attributes"] != null
          ? AlbumsAttributes.fromJson(json["attributes"])
          : null,
      relationships: json["relationships"] != null
          ? AlbumsRelationships.fromJson(json["relationships"])
          : null,
      views: json["views"] != null ? AlbumsViews.fromJson(json["views"]) : null,
    );
  }
}
