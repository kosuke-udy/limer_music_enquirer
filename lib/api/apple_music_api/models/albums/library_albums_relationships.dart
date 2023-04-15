import 'package:freezed_annotation/freezed_annotation.dart';

import '../artists/library_artists.dart';
import '../base_abstracts.dart';
import '../common_types/common_types.dart';
import 'albums.dart';

part 'library_albums_relationships.freezed.dart';

@freezed
class LibraryAlbumsRelationships
    with _$LibraryAlbumsRelationships
    implements AlbumKindRelationships {
  const factory LibraryAlbumsRelationships({
    Relationship<LibraryArtists>? artists,
    Relationship<Albums>? catalog,
    Relationship<TrackKind>? tracks,
  }) = _LibraryAlbumsRelationships;

  factory LibraryAlbumsRelationships.fromJson(Map<String, dynamic> json) {
    return LibraryAlbumsRelationships(
      artists: json["artists"] != null
          ? Relationship<LibraryArtists>.fromJson(json["artists"])
          : null,
      catalog: json["catalog"] != null
          ? Relationship<Albums>.fromJson(json["catalog"])
          : null,
      tracks: json["tracks"] != null
          ? Relationship<TrackKind>.fromJson(json["tracks"])
          : null,
    );
  }
}
