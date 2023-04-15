import 'package:freezed_annotation/freezed_annotation.dart';

import '../artists/artists.dart';
// import '../genres/genres.dart';
// import '../record_labels/record_labels.dart';
import '../../converter/converter.dart';
import '../base_abstracts.dart';
import 'library_albums.dart';

part 'albums_relationships.freezed.dart';

@freezed
class AlbumsRelationships
    with _$AlbumsRelationships
    implements AlbumKindRelationships {
  const factory AlbumsRelationships({
    List<Artists>? artists,
    // List<Genres>? genres,
    List<TrackKind>? tracks,
    List<LibraryAlbums>? library,
    // List<RecordLabels>? recordLabels,
  }) = _AlbumsRelationships;

  factory AlbumsRelationships.fromJson(Map<String, dynamic> json) {
    return AlbumsRelationships(
      artists: json["artists"] != null ? convertToList(json["artists"]) : null,
      // genres:
      //     json["genres"] != null ? convertToList(json["genres"]) : null,
      tracks: json["tracks"] != null ? convertToList(json["tracks"]) : null,
      // recordLabels: json["recordLabels"] != null
      //     ? convertToList(json["recordLabels"])
      //     : null,
      library: json["library"] != null ? convertToList(json["library"]) : null,
    );
  }
}
