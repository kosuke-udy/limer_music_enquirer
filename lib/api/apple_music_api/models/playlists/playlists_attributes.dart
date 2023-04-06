import 'package:freezed_annotation/freezed_annotation.dart';

import '../common_types/artwork.dart';
import '../common_types/description_attribute.dart';
import '../common_types/play_parameters.dart';
import '../util_types.dart';
import 'playlist_type.dart';

part 'playlists_attributes.freezed.dart';

@freezed
class PlaylistsAttributes
    with _$PlaylistsAttributes
    implements PlaylistKindAttributes {
  const factory PlaylistsAttributes({
    Artwork? artwork,
    required String curatorName,
    DescriptionAttribute? description,
    required bool isChart,
    String? lastModifiedDate,
    required String name,
    required PlaylistType playlistType,
    PlayParameters? playParams,
    required String url,
    List<String>? trackTypes,
  }) = _PlaylistsAttributes;

  factory PlaylistsAttributes.fromJson(Map<String, dynamic> json) {
    return PlaylistsAttributes(
      artwork: json['artwork'] == null
          ? null
          : Artwork.fromJson(json['artwork'] as Map<String, dynamic>),
      curatorName: json['curatorName'] as String,
      description: json['description'] == null
          ? null
          : DescriptionAttribute.fromJson(
              json['description'] as Map<String, dynamic>),
      isChart: json['isChart'] as bool,
      lastModifiedDate: json['lastModifiedDate'] as String?,
      name: json['name'] as String,
      playlistType: PlaylistType.fromJson(json['playlistType'] as String),
      playParams: json['playParams'] == null
          ? null
          : PlayParameters.fromJson(json['playParams'] as Map<String, dynamic>),
      url: json['url'] as String,
      trackTypes: (json['trackTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }
}
