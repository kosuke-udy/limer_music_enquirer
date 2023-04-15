import 'package:freezed_annotation/freezed_annotation.dart';

import '../common_types/common_types.dart';
import '../music_videos/music_videos.dart';
import '../playlists/playlists.dart';
import 'albums.dart';

part 'albums_views.freezed.dart';

@freezed
class AlbumsViews with _$AlbumsViews {
  const factory AlbumsViews({
    // String? appearsOnTitle,
    // List<Playlists>? appearsOn,
    // String? otherVersionsTitle,
    // List<Albums>? otherVersions,
    // String? relatedAlbumsTitle,
    // List<Albums>? relatedAlbums,
    // String? relatedVideosTitle,
    // List<MusicVideos>? relatedVideos,

    TitledView<Playlists>? appearsOn,
    TitledView<Albums>? otherVersions,
    TitledView<Albums>? relatedAlbums,
    TitledView<MusicVideos>? relatedVideos,
  }) = _AlbumsViews;

  factory AlbumsViews.fromJson(Map<String, dynamic> json) {
    return AlbumsViews(
      appearsOn: json["appearsOn"] != null
          ? TitledView<Playlists>.fromJson(json["appearsOn"])
          : null,
      otherVersions: json["otherVersions"] != null
          ? TitledView<Albums>.fromJson(json["otherVersions"])
          : null,
      relatedAlbums: json["relatedAlbums"] != null
          ? TitledView<Albums>.fromJson(json["relatedAlbums"])
          : null,
      relatedVideos: json["relatedVideos"] != null
          ? TitledView<MusicVideos>.fromJson(json["relatedVideos"])
          : null,
    );
  }
}
