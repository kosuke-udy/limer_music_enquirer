import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter/converter.dart';
import '../albums/library_albums.dart';
import '../artists/library_artists.dart';
import '../util_types.dart';
import 'music_videos.dart';

part 'library_music_videos_relationships.freezed.dart';

@freezed
class LibraryMusicVideosRelationships
    with _$LibraryMusicVideosRelationships
    implements MusicVideoKindRelationships {
  const factory LibraryMusicVideosRelationships({
    List<LibraryAlbums>? albums,
    List<LibraryArtists>? artists,
    List<MusicVideos>? catalog,
  }) = _LibraryMusicVideosRelationships;

  factory LibraryMusicVideosRelationships.fromJson(Map<String, dynamic> json) {
    return LibraryMusicVideosRelationships(
      albums: json["albums"] != null ? convertToList(json["albums"]) : null,
      artists: json["artists"] != null ? convertToList(json["artists"]) : null,
      catalog: json["catalog"] != null ? convertToList(json["catalog"]) : null,
    );
  }
}
