import 'package:freezed_annotation/freezed_annotation.dart';

import '../base_abstracts.dart';
import 'songs_attributes.dart';
import 'songs_relationships.dart';

part 'songs.freezed.dart';

@freezed
class Songs with _$Songs implements SongKind {
  const factory Songs({
    required String id,
    required ResourceType type,
    String? href,
    SongsAttributes? attributes,
    SongsRelationships? relationships,
  }) = _Songs;

  factory Songs.fromJson(Map<String, dynamic> json) {
    return Songs(
      id: json["id"],
      type: ResourceType.fromJson(json["type"]),
      href: json["href"],
      attributes: json["attributes"] != null
          ? SongsAttributes.fromJson(json["attributes"])
          : null,
      relationships: json["relationships"] != null
          ? SongsRelationships.fromJson(json["relationships"])
          : null,
    );
  }
}
