import 'package:freezed_annotation/freezed_annotation.dart';

import '../albums/albums.dart';
import '../common_types/common_types.dart';
import '../music_videos/music_videos.dart';
import '../playlists/playlists.dart';
import '../base_abstracts.dart';

part 'artists_relationships.freezed.dart';

@freezed
class ArtistsRelationships
    with _$ArtistsRelationships
    implements ArtistKindRelationships {
  factory ArtistsRelationships({
    // List<Albums>? albums,
    // // List<Genres>? genres,
    // List<MusicVideos>? musicVideos,
    // List<Playlists>? playlists,
    // // List<Stations>? station,

    Relationship<Albums>? albums,
    // Relationship<Genres>? genres,
    Relationship<MusicVideos>? musicVideos,
    Relationship<Playlists>? playlists,
    // Relationship<Stations>? station,
  }) = _ArtistsRelationships;

  factory ArtistsRelationships.fromJson(Map<String, dynamic> json) {
    return ArtistsRelationships(
      albums: json["albums"] != null
          ? Relationship<Albums>.fromJson(json["albums"])
          : null,
      // genres: json["genres"] != null
      //     ? Relationship<Genres>.fromJson(json["genres"])
      //     : null,
      musicVideos: json["musicVideos"] != null
          ? Relationship<MusicVideos>.fromJson(json["musicVideos"])
          : null,
      playlists: json["playlists"] != null
          ? Relationship<Playlists>.fromJson(json["playlists"])
          : null,
      // station: json["station"] != null
      //     ? Relationship<Stations>.fromJson(json["station"])
      //     : null,
    );
  }
}
