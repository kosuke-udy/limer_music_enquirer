import 'package:freezed_annotation/freezed_annotation.dart';

import '../albums/albums.dart';
import '../artists/artists.dart';
import '../common_types/common_types.dart';
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
    Relationship<Albums>? albums,
    Relationship<Artists>? artists,
    Relationship<Artists>? composers,
    // Relationship<Genres>? genres,
    Relationship<LibrarySongs>? library,
    Relationship<MusicVideos>? musicVideos,
    // Relationship<Stations>? station,
  }) = _SongsRelationships;

  factory SongsRelationships.fromJson(Map<String, dynamic> json) {
    return SongsRelationships(
      albums: json["albums"] != null
          ? Relationship<Albums>.fromJson(json["albums"])
          : null,
      artists: json["artists"] != null
          ? Relationship<Artists>.fromJson(json["artists"])
          : null,
      composers: json["composers"] != null
          ? Relationship<Artists>.fromJson(json["composers"])
          : null,
      // genres: json["genres"] != null
      //     ? Relationship<Genres>.fromJson(json["genres"])
      //     : null,
      library: json["library"] != null
          ? Relationship<LibrarySongs>.fromJson(json["library"])
          : null,
      musicVideos: json["musicVideos"] != null
          ? Relationship<MusicVideos>.fromJson(json["musicVideos"])
          : null,
      // station: json["station"] != null
      //     ? Relationship<Stations>.fromJson(json["station"])
      //     : null,
    );
  }
}
