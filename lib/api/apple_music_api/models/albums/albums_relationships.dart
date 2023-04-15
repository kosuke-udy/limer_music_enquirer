import 'package:freezed_annotation/freezed_annotation.dart';

import '../artists/artists.dart';
import '../common_types/common_types.dart';
import '../base_abstracts.dart';
import 'library_albums.dart';

part 'albums_relationships.freezed.dart';

@freezed
class AlbumsRelationships
    with _$AlbumsRelationships
    implements AlbumKindRelationships {
  const factory AlbumsRelationships({
    Relationship<Artists>? artists,
    // Relationship<Genres>? genres,
    Relationship<TrackKind>? tracks,
    Relationship<LibraryAlbums>? library,
    // Relationship<RecordLabels>? recordLabels,
  }) = _AlbumsRelationships;

  factory AlbumsRelationships.fromJson(Map<String, dynamic> json) {
    return AlbumsRelationships(
      artists: json["artists"] != null
          ? Relationship<Artists>.fromJson(json["artists"])
          : null,
      // genres: json["genres"] != null
      //     ? Relationship<Genres>.fromJson(json["genres"])
      //     : null,
      tracks: json["tracks"] != null
          ? Relationship<TrackKind>.fromJson(json["tracks"])
          : null,
      library: json["library"] != null
          ? Relationship<LibraryAlbums>.fromJson(json["library"])
          : null,
      // recordLabels: json["recordLabels"] != null
      //     ? Relationship<RecordLabels>.fromJson(json["recordLabels"])
      //     : null,
    );
  }
}
