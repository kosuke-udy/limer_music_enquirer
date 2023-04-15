import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter/converter.dart';
import '../albums/albums.dart';
import '../artists/artists.dart';
import '../common_types/common_types.dart';
// import '../genres/genres.dart';
import '../songs/songs.dart';
import '../base_abstracts.dart';
import 'library_music_videos.dart';

part 'music_videos_relationships.freezed.dart';

@freezed
class MusicVideosRelationships
    with _$MusicVideosRelationships
    implements MusicVideoKindRelationships {
  const factory MusicVideosRelationships({
    Relationship<Albums>? albums,
    Relationship<Artists>? artists,
    // Relationship<Genres>? genres,
    Relationship<LibraryMusicVideos>? library,
    Relationship<Songs>? songs,
  }) = _MusicVideosRelationships;

  factory MusicVideosRelationships.fromJson(Map<String, dynamic> json) {
    return MusicVideosRelationships(
      albums:
          json["albums"] != null ? Relationship.fromJson(json["albums"]) : null,
      artists: json["artists"] != null
          ? Relationship.fromJson(json["artists"])
          : null,
      // genres:
      //     json["genres"] != null ? Relationship.fromJson(json["genres"]) : null,
      library: json["library"] != null
          ? Relationship.fromJson(json["library"])
          : null,
      songs:
          json["songs"] != null ? Relationship.fromJson(json["songs"]) : null,
    );
  }
}
