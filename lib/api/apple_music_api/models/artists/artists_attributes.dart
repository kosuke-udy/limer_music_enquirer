import 'package:freezed_annotation/freezed_annotation.dart';

import '../common_types/artwork.dart';
import '../common_types/editorial_notes.dart';
import '../abstracts_base.dart';

part 'artists_attributes.freezed.dart';

@freezed
class ArtistsAttributes
    with _$ArtistsAttributes
    implements ArtistKindAttributes {
  const factory ArtistsAttributes({
    Artwork? artwork,
    EditorialNotes? editorialNotes,
    required List<String> genreNames,
    required String name,
    required String url,
  }) = _ArtistsAttributes;

  factory ArtistsAttributes.fromJson(Map<String, dynamic> json) {
    return ArtistsAttributes(
      artwork: json['artwork'] == null
          ? null
          : Artwork.fromJson(json['artwork'] as Map<String, dynamic>),
      editorialNotes: json['editorialNotes'] == null
          ? null
          : EditorialNotes.fromJson(
              json['editorialNotes'] as Map<String, dynamic>),
      genreNames: (json['genreNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}
