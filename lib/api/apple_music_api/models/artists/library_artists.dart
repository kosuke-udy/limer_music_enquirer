import 'package:freezed_annotation/freezed_annotation.dart';

import '../base_abstracts.dart';
import 'library_artists_attributes.dart';
import 'library_artists_relationships.dart';

part 'library_artists.freezed.dart';

@freezed
class LibraryArtists with _$LibraryArtists implements ArtistKind {
  const factory LibraryArtists({
    required String id,
    required ResourceType type,
    String? href,
    LibraryArtistsAttributes? attributes,
    LibraryArtistsRelationships? relationships,
  }) = _LibraryArtists;

  factory LibraryArtists.fromJson(Map<String, dynamic> json) {
    return LibraryArtists(
      id: json["id"],
      type: ResourceType.fromJson(json["type"]),
      href: json["href"],
      attributes: json["attributes"] != null
          ? LibraryArtistsAttributes.fromJson(json["attributes"])
          : null,
      relationships: json["relationships"] != null
          ? LibraryArtistsRelationships.fromJson(json["relationships"])
          : null,
    );
  }
}
