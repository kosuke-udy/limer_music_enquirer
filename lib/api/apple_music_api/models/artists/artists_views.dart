import 'package:freezed_annotation/freezed_annotation.dart';

import '../albums/albums.dart';
import '../music_videos/music_videos.dart';
import '../common_types/common_types.dart';
import '../playlists/playlists.dart';
import '../songs/songs.dart';
import 'artists.dart';

part 'artists_views.freezed.dart';

@freezed
class ArtistsViews with _$ArtistsViews {
  factory ArtistsViews({
    TitledView<Albums>? appearsOnAlbums,
    TitledView<Albums>? compilationAlbums,
    TitledView<Albums>? featuredAlbums,
    TitledView<MusicVideos>? featuredMusicVideos,
    TitledView<Playlists>? featuredPlaylists,
    TitledView<Albums>? fullAlbums,
    TitledView<Albums>? latestRelease,
    TitledView<Albums>? liveAlbums,
    TitledView<Artists>? similarArtists,
    TitledView<Albums>? singles,
    TitledView<MusicVideos>? topMusicVideos,
    TitledView<Songs>? topSongs,
  }) = _ArtistsViews;

  factory ArtistsViews.fromJson(Map<String, dynamic> json) {
    return ArtistsViews(
      appearsOnAlbums: json["appearsOnAlbums"] != null
          ? TitledView<Albums>.fromJson(json["appearsOnAlbums"])
          : null,
      compilationAlbums: json["compilationAlbums"] != null
          ? TitledView<Albums>.fromJson(json["compilationAlbums"])
          : null,
      featuredAlbums: json["featuredAlbums"] != null
          ? TitledView<Albums>.fromJson(json["featuredAlbums"])
          : null,
      featuredMusicVideos: json["featuredMusicVideos"] != null
          ? TitledView<MusicVideos>.fromJson(json["featuredMusicVideos"])
          : null,
      featuredPlaylists: json["featuredPlaylists"] != null
          ? TitledView<Playlists>.fromJson(json["featuredPlaylists"])
          : null,
      fullAlbums: json["fullAlbums"] != null
          ? TitledView<Albums>.fromJson(json["fullAlbums"])
          : null,
      latestRelease: json["latestRelease"] != null
          ? TitledView<Albums>.fromJson(json["latestRelease"])
          : null,
      liveAlbums: json["liveAlbums"] != null
          ? TitledView<Albums>.fromJson(json["liveAlbums"])
          : null,
      similarArtists: json["similarArtists"] != null
          ? TitledView<Artists>.fromJson(json["similarArtists"])
          : null,
      singles: json["singles"] != null
          ? TitledView<Albums>.fromJson(json["singles"])
          : null,
      topMusicVideos: json["topMusicVideos"] != null
          ? TitledView<MusicVideos>.fromJson(json["topMusicVideos"])
          : null,
      topSongs: json["topSongs"] != null
          ? TitledView<Songs>.fromJson(json["topSongs"])
          : null,
    );
  }
}
