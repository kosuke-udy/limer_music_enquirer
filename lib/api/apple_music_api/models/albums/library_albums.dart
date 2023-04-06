import 'package:freezed_annotation/freezed_annotation.dart';

import '../util_types.dart';
import 'library_albums_attributes.dart';
import 'library_albums_relationships.dart';

part 'library_albums.freezed.dart';

@freezed
class LibraryAlbums with _$LibraryAlbums implements AlbumKind {
  const factory LibraryAlbums({
    required String id,
    required ResourceType type,
    LibraryAlbumsAttributes? attributes,
    LibraryAlbumsRelationships? relationships,
  }) = _LibraryAlbums;

  factory LibraryAlbums.fromJson(Map<String, dynamic> json) {
    return LibraryAlbums(
      id: json["id"],
      type: ResourceType.fromJson(json["type"]),
      attributes: json["attributes"] != null
          ? LibraryAlbumsAttributes.fromJson(json["attributes"])
          : null,
      relationships: json["relationships"] != null
          ? LibraryAlbumsRelationships.fromJson(json["relationships"])
          : null,
    );
  }
}
