import 'package:freezed_annotation/freezed_annotation.dart';

import '../albums/library_albums.dart';
import '../base_abstracts.dart';
import '../common_types/common_types.dart';
import 'artists.dart';

part 'library_artists_relationships.freezed.dart';

@freezed
class LibraryArtistsRelationships
    with _$LibraryArtistsRelationships
    implements ArtistKindRelationships {
  const factory LibraryArtistsRelationships({
    Relationship<Artists>? artists,
    Relationship<LibraryAlbums>? catalog,
  }) = _LibraryArtistsRelationships;

  factory LibraryArtistsRelationships.fromJson(Map<String, dynamic> json) {
    return LibraryArtistsRelationships(
      artists: json["artists"] != null
          ? Relationship<Artists>.fromJson(json["artists"])
          : null,
      catalog: json["catalog"] != null
          ? Relationship<LibraryAlbums>.fromJson(json["catalog"])
          : null,
    );
  }
}
