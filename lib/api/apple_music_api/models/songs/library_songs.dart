import 'package:freezed_annotation/freezed_annotation.dart';

import '../base_abstracts.dart';
import 'library_songs_attributes.dart';
import 'library_songs_relationships.dart';

part 'library_songs.freezed.dart';

@freezed
class LibrarySongs with _$LibrarySongs implements SongKind {
  const factory LibrarySongs({
    required String id,
    required ResourceType type,
    String? href,
    LibrarySongsAttributes? attributes,
    LibrarySongsRelationships? relationships,
  }) = _LibrarySongs;

  factory LibrarySongs.fromJson(Map<String, dynamic> json) {
    return LibrarySongs(
      id: json["id"],
      type: ResourceType.fromJson(json["type"]),
      href: json["href"],
      attributes: json["attributes"] != null
          ? LibrarySongsAttributes.fromJson(json["attributes"])
          : null,
      relationships: json["relationships"] != null
          ? LibrarySongsRelationships.fromJson(json["relationships"])
          : null,
    );
  }
}
