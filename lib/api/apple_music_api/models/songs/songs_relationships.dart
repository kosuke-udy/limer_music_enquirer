import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter/converter.dart';
import '../albums/albums.dart';
import '../artists/artists.dart';
// import '../genres/genres.dart';
import '../music_videos/music_videos.dart';
// import '../stations/stations.dart';
import '../base_abstracts.dart';
import 'library_songs.dart';

part 'songs_relationships.freezed.dart';

@freezed
class SongsRelationships
    with _$SongsRelationships
    implements SongKindRelationships {
  const factory SongsRelationships({
    List<Albums>? albums,
    List<Artists>? artists,
    List<Artists>? composers,
    // List<Genres>? genres,
    List<LibrarySongs>? library,
    List<MusicVideos>? musicVideos,
    // List<Stations>? station,
  }) = _SongsRelationships;

  factory SongsRelationships.fromJson(Map<String, dynamic> json) {
    return SongsRelationships(
      albums: json["albums"] != null ? convertToList(json["albums"]) : null,
      artists: json["artists"] != null ? convertToList(json["artists"]) : null,
      composers:
          json["composers"] != null ? convertToList(json["composers"]) : null,
      // genres:
      //     json["genres"] != null ? convertToList(json["genres"]) : null,
      library: json["library"] != null ? convertToList(json["library"]) : null,
      musicVideos: json["musicVideos"] != null
          ? convertToList(json["musicVideos"])
          : null,
      // station:
      //     json["station"] != null ? convertToList(json["station"]) : null,
    );
  }
}
