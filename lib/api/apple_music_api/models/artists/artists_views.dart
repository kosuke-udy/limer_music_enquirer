import 'package:freezed_annotation/freezed_annotation.dart';

import '../albums/albums.dart';
import '../music_videos/music_videos.dart';
import '../playlists/playlists.dart';
import '../songs/songs.dart';
import 'artists.dart';

part 'artists_views.freezed.dart';

@freezed
class ArtistsViews with _$ArtistsViews {
  factory ArtistsViews({
    String? appearsOnAlbumsTitle,
    List<Albums>? appearsOnAlbums,
    String? compilationAlbumsTitle,
    List<Albums>? compilationAlbums,
    String? featuredAlbumsTitle,
    List<Albums>? featuredAlbums,
    String? featuredMusicVideosTitle,
    List<MusicVideos>? featuredMusicVideos,
    String? featuredPlaylistsTitle,
    List<Playlists>? featuredPlaylists,
    String? fullAlbumsTitle,
    List<Albums>? fullAlbums,
    String? latestReleaseTitle,
    List<Albums>? latestRelease,
    String? liveAlbumsTitle,
    List<Albums>? liveAlbums,
    String? similarArtistsTitle,
    List<Artists>? similarArtists,
    String? singlesTitle,
    List<Albums>? singles,
    String? topMusicVideosTitle,
    List<MusicVideos>? topMusicVideos,
    String? topSongsTitle,
    List<Songs>? topSongs,
  }) = _ArtistsViews;

  factory ArtistsViews.fromJson(Map<String, dynamic> json) {
    return ArtistsViews(
      appearsOnAlbumsTitle:
          json['appears-on-albums']["attributes"]["title"] as String?,
      appearsOnAlbums: (json['appears-on-albums']["data"] as List<dynamic>?)
          ?.map((e) => Albums.fromJson(e as Map<String, dynamic>))
          .toList(),
      compilationAlbumsTitle:
          json['compilation-albums']["attributes"]["title"] as String?,
      compilationAlbums: (json['compilation-albums']["data"] as List<dynamic>?)
          ?.map((e) => Albums.fromJson(e as Map<String, dynamic>))
          .toList(),
      featuredAlbumsTitle:
          json['featured-albums']["attributes"]["title"] as String?,
      featuredAlbums: (json['featured-albums']["data"] as List<dynamic>?)
          ?.map((e) => Albums.fromJson(e as Map<String, dynamic>))
          .toList(),
      featuredMusicVideosTitle:
          json['featured-music-videos']["attributes"]["title"] as String?,
      featuredMusicVideos:
          (json['featured-music-videos']["data"] as List<dynamic>?)
              ?.map((e) => MusicVideos.fromJson(e as Map<String, dynamic>))
              .toList(),
      featuredPlaylistsTitle:
          json['featured-playlists']["attributes"]["title"] as String?,
      featuredPlaylists: (json['featured-playlists']["data"] as List<dynamic>?)
          ?.map((e) => Playlists.fromJson(e as Map<String, dynamic>))
          .toList(),
      fullAlbumsTitle: json['full-albums']["attributes"]["title"] as String?,
      fullAlbums: (json['full-albums']["data"] as List<dynamic>?)
          ?.map((e) => Albums.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestReleaseTitle:
          json['latest-release']["attributes"]["title"] as String?,
      latestRelease: (json['latest-release']["data"] as List<dynamic>?)
          ?.map((e) => Albums.fromJson(e as Map<String, dynamic>))
          .toList(),
      liveAlbumsTitle: json['live-albums']["attributes"]["title"] as String?,
      liveAlbums: (json['live-albums']["data"] as List<dynamic>?)
          ?.map((e) => Albums.fromJson(e as Map<String, dynamic>))
          .toList(),
      similarArtistsTitle:
          json['similar-artists']["attributes"]["title"] as String?,
      similarArtists: json['similar-artists']["data"] == null
          ? null
          : (json['similar-artists']["data"] as List<dynamic>)
              .map((e) => Artists.fromJson(e as Map<String, dynamic>))
              .toList(),
      singlesTitle: json['singles']["attributes"]["title"] as String?,
      singles: (json['singles']["data"] as List<dynamic>?)
          ?.map((e) => Albums.fromJson(e as Map<String, dynamic>))
          .toList(),
      topMusicVideosTitle:
          json['top-music-videos']["attributes"]["title"] as String?,
      topMusicVideos: (json['top-music-videos']["data"] as List<dynamic>?)
          ?.map((e) => MusicVideos.fromJson(e as Map<String, dynamic>))
          .toList(),
      topSongsTitle: json['top-songs']["attributes"]["title"] as String?,
      topSongs: (json['top-songs']["data"] as List<dynamic>?)
          ?.map((e) => Songs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
