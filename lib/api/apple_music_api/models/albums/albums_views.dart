import 'package:freezed_annotation/freezed_annotation.dart';

import '../music_videos/music_videos.dart';
import '../playlists/playlists.dart';
import 'albums.dart';

part 'albums_views.freezed.dart';

@freezed
class AlbumsViews with _$AlbumsViews {
  const factory AlbumsViews({
    String? appearsOnTitle,
    List<Playlists>? appearsOn,
    String? otherVersionsTitle,
    List<Albums>? otherVersions,
    String? relatedAlbumsTitle,
    List<Albums>? relatedAlbums,
    String? relatedVideosTitle,
    List<MusicVideos>? relatedVideos,
  }) = _AlbumsViews;

  factory AlbumsViews.fromJson(Map<String, dynamic> json) {
    return AlbumsViews(
      appearsOnTitle: json['appears-on']["attributes"]["title"] as String?,
      appearsOn: (json['appears-on']["data"] as List<dynamic>?)
          ?.map((e) => Playlists.fromJson(e as Map<String, dynamic>))
          .toList(),
      otherVersionsTitle:
          json['other-versions']["attributes"]["title"] as String?,
      otherVersions: (json['other-versions']["data"] as List<dynamic>?)
          ?.map((e) => Albums.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedAlbumsTitle:
          json['related-albums']["attributes"]["title"] as String?,
      relatedAlbums: (json['related-albums']["data"] as List<dynamic>?)
          ?.map((e) => Albums.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedVideosTitle:
          json['related-videos']["attributes"]["title"] as String?,
      relatedVideos: (json['related-videos']["data"] as List<dynamic>?)
          ?.map((e) => MusicVideos.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
