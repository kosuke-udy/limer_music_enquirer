import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter/converter.dart';
import '../albums/albums.dart';
import '../artists/artists.dart';
// import '../genres/genres.dart';
import '../songs/songs.dart';
import '../util_types.dart';
import 'library_music_videos.dart';

part 'music_videos_relationships.freezed.dart';

@freezed
class MusicVideosRelationships
    with _$MusicVideosRelationships
    implements MusicVideoKindRelationships {
  const factory MusicVideosRelationships({
    List<Albums>? albums,
    List<Artists>? artists,
    // List<Genres>? genres,
    List<LibraryMusicVideos>? library,
    List<Songs>? songs,
  }) = _MusicVideosRelationships;

  factory MusicVideosRelationships.fromJson(Map<String, dynamic> json) {
    return MusicVideosRelationships(
      albums: json["albums"] != null ? convertToList(json["albums"]) : null,
      artists: json["artists"] != null ? convertToList(json["artists"]) : null,
      // genres:
      //     json["genres"] != null ? convertToList(json["genres"]) : null,
      library: json["library"] != null ? convertToList(json["library"]) : null,
      songs: json["songs"] != null ? convertToList(json["songs"]) : null,
    );
  }
}
