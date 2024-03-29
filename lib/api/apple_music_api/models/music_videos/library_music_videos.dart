import 'package:freezed_annotation/freezed_annotation.dart';

import '../base_abstracts.dart';
import 'library_music_videos_attributes.dart';
import 'library_music_videos_relationships.dart';

part 'library_music_videos.freezed.dart';

@freezed
class LibraryMusicVideos with _$LibraryMusicVideos implements MusicVideoKind {
  const factory LibraryMusicVideos({
    required String id,
    required ResourceType type,
    String? href,
    LibraryMusicVideosAttributes? attributes,
    LibraryMusicVideosRelationships? relationships,
  }) = _LibraryMusicVideos;

  factory LibraryMusicVideos.fromJson(Map<String, dynamic> json) {
    return LibraryMusicVideos(
      id: json["id"],
      type: ResourceType.fromJson(json["type"]),
      href: json["href"],
      attributes: json["attributes"] != null
          ? LibraryMusicVideosAttributes.fromJson(json["attributes"])
          : null,
      relationships: json["relationships"] != null
          ? LibraryMusicVideosRelationships.fromJson(json["relationships"])
          : null,
    );
  }
}
