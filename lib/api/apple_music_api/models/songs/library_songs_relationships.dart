import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter/converter.dart';
import '../albums/library_albums.dart';
import '../artists/library_artists.dart';
import '../base_abstracts.dart';
import 'songs.dart';

part 'library_songs_relationships.freezed.dart';

@freezed
class LibrarySongsRelationships
    with _$LibrarySongsRelationships
    implements SongKindRelationships {
  const factory LibrarySongsRelationships({
    List<LibraryAlbums>? albums,
    List<LibraryArtists>? artists,
    List<Songs>? catalog,
  }) = _LibrarySongsRelationships;

  factory LibrarySongsRelationships.fromJson(Map<String, dynamic> json) {
    return LibrarySongsRelationships(
      albums: json["albums"] != null ? convertToList(json["albums"]) : null,
      artists: json["artists"] != null ? convertToList(json["artists"]) : null,
      catalog: json["catalog"] != null ? convertToList(json["catalog"]) : null,
    );
  }
}
