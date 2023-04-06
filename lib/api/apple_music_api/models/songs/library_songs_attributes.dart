import 'package:freezed_annotation/freezed_annotation.dart';

import '../common_types/common_types.dart';
import '../util_types.dart';

part 'library_songs_attributes.freezed.dart';

@freezed
class LibrarySongsAttributes
    with _$LibrarySongsAttributes
    implements SongKindAttributes {
  const factory LibrarySongsAttributes({
    String? albumName,
    required String artistName,
    required Artwork artwork,
    String? contentRating,
    int? discNumber,
    required int durationInMillis,
    required List<String> genreNames,
    required String name,
    PlayParameters? playParams,
    String? releaseDate,
    int? trackNumber,
  }) = _LibrarySongsAttributes;

  factory LibrarySongsAttributes.fromJson(Map<String, dynamic> json) {
    return LibrarySongsAttributes(
      albumName: json['albumName'] as String?,
      artistName: json['artistName'] as String,
      artwork: Artwork.fromJson(json['artwork'] as Map<String, dynamic>),
      contentRating: json['contentRating'] as String?,
      discNumber: json['discNumber'] as int?,
      durationInMillis: json['durationInMillis'] as int,
      genreNames: (json['genreNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String,
      playParams: json['playParams'] == null
          ? null
          : PlayParameters.fromJson(json['playParams'] as Map<String, dynamic>),
      releaseDate: json['releaseDate'] as String?,
      trackNumber: json['trackNumber'] as int?,
    );
  }
}
