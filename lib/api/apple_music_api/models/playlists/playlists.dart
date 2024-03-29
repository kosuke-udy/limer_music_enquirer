import 'package:freezed_annotation/freezed_annotation.dart';

import '../base_abstracts.dart';
import 'playlists_attributes.dart';
import 'playlists_relationships.dart';
import 'playlists_views.dart';

part 'playlists.freezed.dart';

@freezed
class Playlists with _$Playlists implements PlaylistKind {
  const factory Playlists({
    required String id,
    required ResourceType type,
    String? href,
    PlaylistsAttributes? attributes,
    PlaylistsRelationships? relationships,
    PlaylistsViews? views,
  }) = _Playlists;

  factory Playlists.fromJson(Map<String, dynamic> json) {
    return Playlists(
      id: json["id"],
      type: ResourceType.fromJson(json["type"]),
      href: json["href"],
      attributes: json["attributes"] != null
          ? PlaylistsAttributes.fromJson(json["attributes"])
          : null,
      relationships: json["relationships"] != null
          ? PlaylistsRelationships.fromJson(json["relationships"])
          : null,
      views:
          json["views"] != null ? PlaylistsViews.fromJson(json["views"]) : null,
    );
  }
}
