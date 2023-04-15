import 'package:freezed_annotation/freezed_annotation.dart';

import '../common_types/common_types.dart';
import '../base_abstracts.dart';

part 'music_videos_attributes.freezed.dart';

@freezed
class MusicVideosAttributes
    with _$MusicVideosAttributes
    implements MusicVideoKindAttributes {
  const factory MusicVideosAttributes({
    String? albumName,
    required String artistName,
    String? artistUrl, // Extended
    required Artwork artwork,
    String? contentRating,
    required int durationInMillis,
    EditorialNotes? editorialNotes,
    required List<String> genreNames,
    required bool has4K,
    required bool hasHDR,
    String? isrc,
    required String name,
    PlayParameters? playParams,
    required Preview preview,
    String? releaseDate,
    int? trackNumber,
    required String url,
    String? videoSubType, // Value: "preview"
    String? workId, // Classical only
    String? workName, // Classical only
  }) = _MusicVideosAttributes;

  factory MusicVideosAttributes.fromJson(Map<String, dynamic> json) {
    return MusicVideosAttributes(
      albumName: json['albumName'] as String?,
      artistName: json['artistName'] as String,
      artistUrl: json['artistUrl'] as String?,
      artwork: Artwork.fromJson(json['artwork'] as Map<String, dynamic>),
      contentRating: json['contentRating'] as String?,
      durationInMillis: json['durationInMillis'] as int,
      editorialNotes: json['editorialNotes'] == null
          ? null
          : EditorialNotes.fromJson(
              json['editorialNotes'] as Map<String, dynamic>),
      genreNames: (json['genreNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      has4K: json['has4K'] as bool,
      hasHDR: json['hasHDR'] as bool,
      isrc: json['isrc'] as String?,
      name: json['name'] as String,
      playParams: json['playParams'] == null
          ? null
          : PlayParameters.fromJson(json['playParams'] as Map<String, dynamic>),
      preview: Preview.fromJson(json['preview'] as Map<String, dynamic>),
      releaseDate: json['releaseDate'] as String?,
      trackNumber: json['trackNumber'] as int?,
      url: json['url'] as String,
      videoSubType: json['videoSubType'] as String?,
      workId: json['workId'] as String?,
      workName: json['workName'] as String?,
    );
  }
}
