import 'package:freezed_annotation/freezed_annotation.dart';

import '../abstracts_base.dart';

part 'library_artists_attributes.freezed.dart';
part 'library_artists_attributes.g.dart';

@freezed
class LibraryArtistsAttributes
    with _$LibraryArtistsAttributes
    implements ArtistKindAttributes {
  const factory LibraryArtistsAttributes({
    required String name,
  }) = _LibraryArtistsAttributes;

  factory LibraryArtistsAttributes.fromJson(Map<String, dynamic> json) =>
      _$LibraryArtistsAttributesFromJson(json);
}
