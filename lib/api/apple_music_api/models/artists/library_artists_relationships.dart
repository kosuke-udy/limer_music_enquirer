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
    Relationship<LibraryAlbums>? albums,
    Relationship<Artists>? catalog,
  }) = _LibraryArtistsRelationships;

  factory LibraryArtistsRelationships.fromJson(Map<String, dynamic> json) {
    return LibraryArtistsRelationships(
      albums: json["albums"] != null
          ? Relationship<LibraryAlbums>.fromJson(json["albums"])
          : null,
      catalog: json["catalog"] != null
          ? Relationship<Artists>.fromJson(json["catalog"])
          : null,
    );
  }
}
