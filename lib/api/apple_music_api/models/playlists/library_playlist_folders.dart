import 'package:freezed_annotation/freezed_annotation.dart';

import '../util_types.dart';
import 'library_playlist_folders_attributes.dart';
import 'library_playlist_folders_relationships.dart';

part 'library_playlist_folders.freezed.dart';

@freezed
class LibraryPlaylistFolders
    with _$LibraryPlaylistFolders
    implements ResourceKind {
  const factory LibraryPlaylistFolders({
    required String id,
    required ResourceType type,
    LibraryPlaylistFoldersAttributes? attributes,
    LibraryPlaylistFoldersRelationships? relationships,
  }) = _LibraryPlaylistFolders;

  factory LibraryPlaylistFolders.fromJson(Map<String, dynamic> json) {
    return LibraryPlaylistFolders(
      id: json["id"],
      type: ResourceType.fromJson(json["type"]),
      attributes: json["attributes"] != null
          ? LibraryPlaylistFoldersAttributes.fromJson(json["attributes"])
          : null,
      relationships: json["relationships"] != null
          ? LibraryPlaylistFoldersRelationships.fromJson(json["relationships"])
          : null,
    );
  }
}
