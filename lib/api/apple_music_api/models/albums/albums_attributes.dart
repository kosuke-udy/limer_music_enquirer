import 'package:freezed_annotation/freezed_annotation.dart';

import '../common_types/artwork.dart';
import '../common_types/play_parameters.dart';
import '../abstracts_base.dart';

part 'albums_attributes.freezed.dart';

@freezed
class AlbumsAttributes with _$AlbumsAttributes implements AlbumKindAttributes {
  const factory AlbumsAttributes({
    required String artistName,
    String? artistsUrl, // Extended
    required Artwork artwork,
    List<String>? audioVariants, // Extended
    String? contentRating,
    String? copyright,
    String? dateAdded,
    required List<String> genreNames,
    required bool isCompilation,
    required bool isComplete,
    required bool isMasteredForItunes,
    required bool isSingle,
    required String name,
    PlayParameters? playParams,
    String? releaseDate,
    required int trackCount,
    String? upc,
    required String url,
  }) = _AlbumsAttributes;

  factory AlbumsAttributes.fromJson(Map<String, dynamic> json) {
    return AlbumsAttributes(
      artistName: json['artistName'] as String,
      artistsUrl: json['artistsUrl'] as String?,
      artwork: Artwork.fromJson(json['artwork'] as Map<String, dynamic>),
      audioVariants: (json['audioVariants'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      contentRating: json['contentRating'] as String?,
      copyright: json['copyright'] as String?,
      dateAdded: json['dateAdded'] as String?,
      genreNames: (json['genreNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isCompilation: json['isCompilation'] as bool,
      isComplete: json['isComplete'] as bool,
      isMasteredForItunes: json['isMasteredForItunes'] as bool,
      isSingle: json['isSingle'] as bool,
      name: json['name'] as String,
      playParams: json['playParams'] == null
          ? null
          : PlayParameters.fromJson(json['playParams'] as Map<String, dynamic>),
      releaseDate: json['releaseDate'] as String?,
      trackCount: json['trackCount'] as int,
      upc: json['upc'] as String?,
      url: json['url'] as String,
    );
  }
}
