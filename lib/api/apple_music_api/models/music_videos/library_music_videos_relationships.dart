import 'package:freezed_annotation/freezed_annotation.dart';

import '../albums/library_albums.dart';
import '../artists/library_artists.dart';
import '../base_abstracts.dart';
import '../common_types/common_types.dart';
import 'music_videos.dart';

part 'library_music_videos_relationships.freezed.dart';

@freezed
class LibraryMusicVideosRelationships
    with _$LibraryMusicVideosRelationships
    implements MusicVideoKindRelationships {
  const factory LibraryMusicVideosRelationships({
    Relationship<LibraryAlbums>? albums,
    Relationship<LibraryArtists>? artists,
    Relationship<MusicVideos>? catalog,
  }) = _LibraryMusicVideosRelationships;

  factory LibraryMusicVideosRelationships.fromJson(Map<String, dynamic> json) {
    return LibraryMusicVideosRelationships(
      albums: json["albums"] != null
          ? Relationship<LibraryAlbums>.fromJson(json["albums"])
          : null,
      artists: json["artists"] != null
          ? Relationship<LibraryArtists>.fromJson(json["artists"])
          : null,
      catalog: json["catalog"] != null
          ? Relationship<MusicVideos>.fromJson(json["catalog"])
          : null,
    );
  }
}
