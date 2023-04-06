import 'package:freezed_annotation/freezed_annotation.dart';

import '../util_types.dart';
import 'music_videos_attributes.dart';
import 'music_videos_relationships.dart';
import 'music_videos_views.dart';

part 'music_videos.freezed.dart';

@freezed
class MusicVideos with _$MusicVideos implements MusicVideoKind {
  const factory MusicVideos({
    required String id,
    required ResourceType type,
    MusicVideosAttributes? attributes,
    MusicVideosRelationships? relationships,
    MusicVideosViews? views,
  }) = _MusicVideos;

  factory MusicVideos.fromJson(Map<String, dynamic> json) {
    return MusicVideos(
      id: json["id"],
      type: ResourceType.fromJson(json["type"]),
      attributes: json["attributes"] != null
          ? MusicVideosAttributes.fromJson(json["attributes"])
          : null,
      relationships: json["relationships"] != null
          ? MusicVideosRelationships.fromJson(json["relationships"])
          : null,
      views: json["views"] != null
          ? MusicVideosViews.fromJson(json["views"])
          : null,
    );
  }
}
