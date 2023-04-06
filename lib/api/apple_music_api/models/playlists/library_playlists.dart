import 'package:freezed_annotation/freezed_annotation.dart';

import '../util_types.dart';
import 'library_playlists_attributes.dart';
import 'library_playlists_relationships.dart';

part 'library_playlists.freezed.dart';

@freezed
class LibraryPlaylists with _$LibraryPlaylists implements PlaylistKind {
  const factory LibraryPlaylists({
    required String id,
    required ResourceType type,
    LibraryPlaylistsAttributes? attributes,
    LibraryPlaylistsRelationships? relationships,
  }) = _LibraryPlaylists;

  factory LibraryPlaylists.fromJson(Map<String, dynamic> json) {
    return LibraryPlaylists(
      id: json["id"],
      type: ResourceType.fromJson(json["type"]),
      attributes: json["attributes"] != null
          ? LibraryPlaylistsAttributes.fromJson(json["attributes"])
          : null,
      relationships: json["relationships"] != null
          ? LibraryPlaylistsRelationships.fromJson(json["relationships"])
          : null,
    );
  }
}
