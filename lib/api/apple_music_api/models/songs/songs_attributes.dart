import 'package:freezed_annotation/freezed_annotation.dart';

import '../common_types/artwork.dart';
import '../common_types/editorial_notes.dart';
import '../common_types/play_parameters.dart';
import '../common_types/preview.dart';
import '../abstracts_base.dart';

part 'songs_attributes.freezed.dart';

@freezed
class SongsAttributes with _$SongsAttributes implements SongKindAttributes {
  const factory SongsAttributes({
    required String albumName,
    required String artistName,
    String? artistUrl, // Extended
    required Artwork artwork,
    String? attribution, // Classical only
    List<String>? audioVariants, // Extended
    String? composerName,
    String? contentRating,
    int? discNumber,
    required int durationInMillis,
    EditorialNotes? editorialNotes,
    required List<String> genreNames,
    required bool hasLyrics,
    required bool isAppleDigitalMaster,
    String? isrc,
    int? movementCount, // Classical only
    String? movementName, // Classical only
    int? movementNumber, // Classical only
    required String name,
    PlayParameters? playParams,
    required List<Preview> previews,
    String? releaseDate,
    int? trackNumber,
    required String url,
    String? workName, // Classical only
  }) = _SongsAttributes;

  factory SongsAttributes.fromJson(Map<String, dynamic> json) {
    return SongsAttributes(
      albumName: json['albumName'] as String,
      artistName: json['artistName'] as String,
      artistUrl: json['artistUrl'] as String?,
      artwork: Artwork.fromJson(json['artwork'] as Map<String, dynamic>),
      attribution: json['attribution'] as String?,
      audioVariants: (json['audioVariants'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      composerName: json['composerName'] as String?,
      contentRating: json['contentRating'] as String?,
      discNumber: json['discNumber'] as int?,
      durationInMillis: json['durationInMillis'] as int,
      editorialNotes: json['editorialNotes'] == null
          ? null
          : EditorialNotes.fromJson(
              json['editorialNotes'] as Map<String, dynamic>),
      genreNames: (json['genreNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      hasLyrics: json['hasLyrics'] as bool,
      isAppleDigitalMaster: json['isAppleDigitalMaster'] as bool,
      isrc: json['isrc'] as String?,
      movementCount: json['movementCount'] as int?,
      movementName: json['movementName'] as String?,
      movementNumber: json['movementNumber'] as int?,
      name: json['name'] as String,
      playParams: json['playParams'] == null
          ? null
          : PlayParameters.fromJson(json['playParams'] as Map<String, dynamic>),
      previews: (json['previews'] as List<dynamic>)
          .map((e) => Preview.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['releaseDate'] as String?,
      trackNumber: json['trackNumber'] as int?,
      url: json['url'] as String,
      workName: json['workName'] as String?,
    );
  }
}
