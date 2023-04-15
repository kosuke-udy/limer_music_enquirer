import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter/converter.dart';
import '../artists/library_artists.dart';
import '../base_abstracts.dart';
import 'albums.dart';

part 'library_albums_relationships.freezed.dart';

@freezed
class LibraryAlbumsRelationships
    with _$LibraryAlbumsRelationships
    implements AlbumKindRelationships {
  const factory LibraryAlbumsRelationships({
    List<LibraryArtists>? artists,
    List<Albums>? catalog,
    List<TrackKind>? tracks,
  }) = _LibraryAlbumsRelationships;

  factory LibraryAlbumsRelationships.fromJson(Map<String, dynamic> json) {
    return LibraryAlbumsRelationships(
      artists: json["artists"] != null ? convertToList(json["artists"]) : null,
      catalog: json["catalog"] != null ? convertToList(json["catalog"]) : null,
      tracks: json["tracks"] != null ? convertToList(json["tracks"]) : null,
    );
  }
}
