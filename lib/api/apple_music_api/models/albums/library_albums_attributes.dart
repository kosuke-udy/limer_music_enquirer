import 'package:freezed_annotation/freezed_annotation.dart';

import '../common_types/artwork.dart';
import '../common_types/play_parameters.dart';
import '../util_types.dart';

part 'library_albums_attributes.freezed.dart';

@freezed
class LibraryAlbumsAttributes
    with _$LibraryAlbumsAttributes
    implements AlbumKindAttributes {
  const factory LibraryAlbumsAttributes({
    required String artistName,
    required Artwork artwork,
    String? contentRating,
    String? dateAdded,
    required String name,
    PlayParameters? playParams,
    String? releaseDate,
    required int trackCount,
    required List<String> genreNames,
  }) = _LibraryAlbumsAttributes;

  factory LibraryAlbumsAttributes.fromJson(Map<String, dynamic> json) {
    return LibraryAlbumsAttributes(
      artistName: json['artistName'] as String,
      artwork: Artwork.fromJson(json['artwork'] as Map<String, dynamic>),
      contentRating: json['contentRating'] as String?,
      dateAdded: json['dateAdded'] as String?,
      name: json['name'] as String,
      playParams: json['playParams'] == null
          ? null
          : PlayParameters.fromJson(json['playParams'] as Map<String, dynamic>),
      releaseDate: json['releaseDate'] as String?,
      trackCount: json['trackCount'] as int,
      genreNames: (json['genreNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
  }
}
