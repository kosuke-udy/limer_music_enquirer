import 'package:freezed_annotation/freezed_annotation.dart';

import '../albums/library_albums.dart';
import '../artists/library_artists.dart';
import '../common_types/common_types.dart';
import '../base_abstracts.dart';
import 'songs.dart';

part 'library_songs_relationships.freezed.dart';

@freezed
class LibrarySongsRelationships
    with _$LibrarySongsRelationships
    implements SongKindRelationships {
  const factory LibrarySongsRelationships({
    Relationship<LibraryAlbums>? albums,
    Relationship<LibraryArtists>? artists,
    Relationship<Songs>? catalog,
  }) = _LibrarySongsRelationships;

  factory LibrarySongsRelationships.fromJson(Map<String, dynamic> json) {
    return LibrarySongsRelationships(
      albums: json["albums"] != null
          ? Relationship<LibraryAlbums>.fromJson(json["albums"])
          : null,
      artists: json["artists"] != null
          ? Relationship<LibraryArtists>.fromJson(json["artists"])
          : null,
      catalog: json["catalog"] != null
          ? Relationship<Songs>.fromJson(json["catalog"])
          : null,
    );
  }
}
