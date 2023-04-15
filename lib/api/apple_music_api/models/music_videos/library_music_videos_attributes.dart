import 'package:freezed_annotation/freezed_annotation.dart';

import '../common_types/common_types.dart';
import '../base_abstracts.dart';

part 'library_music_videos_attributes.freezed.dart';

@freezed
class LibraryMusicVideosAttributes
    with _$LibraryMusicVideosAttributes
    implements MusicVideoKindAttributes {
  const factory LibraryMusicVideosAttributes({
    String? albumName,
    required String artistName,
    required Artwork artwork,
    String? contentRating,
    required int durationInMillis,
    required List<String> genreNames,
    required String name,
    PlayParameters? playParams,
    String? releaseDate,
    int? trackNumber,
  }) = _LibraryMusicVideosAttributes;

  factory LibraryMusicVideosAttributes.fromJson(Map<String, dynamic> json) {
    return LibraryMusicVideosAttributes(
      albumName: json['albumName'] as String?,
      artistName: json['artistName'] as String,
      artwork: Artwork.fromJson(json['artwork'] as Map<String, dynamic>),
      contentRating: json['contentRating'] as String?,
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
