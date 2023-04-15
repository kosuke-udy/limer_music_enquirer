import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter/converter.dart';
import '../albums/albums.dart';
// import '../genres/genres.dart';
import '../music_videos/music_videos.dart';
import '../playlists/playlists.dart';
// import '../stations/stations.dart';
import '../base_abstracts.dart';

part 'artists_relationships.freezed.dart';

@freezed
class ArtistsRelationships
    with _$ArtistsRelationships
    implements ArtistKindRelationships {
  factory ArtistsRelationships({
    List<Albums>? albums,
    // List<Genres>? genres,
    List<MusicVideos>? musicVideos,
    List<Playlists>? playlists,
    // List<Stations>? station,
  }) = _ArtistsRelationships;

  factory ArtistsRelationships.fromJson(Map<String, dynamic> json) {
    return ArtistsRelationships(
      albums: json["albums"] != null ? convertToList(json["albums"]) : null,
      // genres: json["genres"] != null ? convertToList(json["genres"]) : null,
      musicVideos: json["musicVideos"] != null
          ? convertToList(json["musicVideos"])
          : null,
      playlists:
          json["playlists"] != null ? convertToList(json["playlists"]) : null,
      // station: json["station"] != null ? convertToList(json["station"]) : null,
    );
  }
}
