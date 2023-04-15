import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter/converter.dart';
import '../albums/library_albums.dart';
import '../base_abstracts.dart';
import 'artists.dart';

part 'library_artists_relationships.freezed.dart';

@freezed
class LibraryArtistsRelationships
    with _$LibraryArtistsRelationships
    implements ArtistKindRelationships {
  const factory LibraryArtistsRelationships({
    List<Artists>? artists,
    List<LibraryAlbums>? catalog,
  }) = _LibraryArtistsRelationships;

  factory LibraryArtistsRelationships.fromJson(Map<String, dynamic> json) {
    return LibraryArtistsRelationships(
      artists: json["artists"] != null ? convertToList(json["artists"]) : null,
      catalog: json["catalog"] != null ? convertToList(json["catalog"]) : null,
    );
  }
}
