import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter/converter.dart';
import '../common_types/common_types.dart';
import '../base_abstracts.dart';
import 'playlists.dart';

part 'library_playlists_relationships.freezed.dart';

@freezed
class LibraryPlaylistsRelationships
    with _$LibraryPlaylistsRelationships
    implements PlaylistKindRelationships {
  const factory LibraryPlaylistsRelationships({
    Relationship<Playlists>? catalog,
    Relationship<TrackKind>? tracks,
  }) = _LibraryPlaylistsRelationships;

  factory LibraryPlaylistsRelationships.fromJson(Map<String, dynamic> json) {
    return LibraryPlaylistsRelationships(
      catalog: json["catalog"] != null
          ? Relationship.fromJson(json["catalog"])
          : null,
      tracks:
          json["tracks"] != null ? Relationship.fromJson(json["tracks"]) : null,
    );
  }
}
