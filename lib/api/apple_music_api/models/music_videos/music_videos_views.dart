import 'package:freezed_annotation/freezed_annotation.dart';

import 'music_videos.dart';

part 'music_videos_views.freezed.dart';

@freezed
class MusicVideosViews with _$MusicVideosViews {
  const factory MusicVideosViews({
    /* 
      More music videos of some type by the artist
      Fetch limits: 15 default, 100 maximum
    */
    List<MusicVideos>? moreByArtist,
    String? moreByArtistTitle,

    /*
      More music videos in the given music video genre
      Fetch limits: 15 default, 100 maximu
    */
    List<MusicVideos>? moreInGenre,
    String? moreInGenreTitle,
  }) = _MusicVideosViews;

  factory MusicVideosViews.fromJson(Map<String, dynamic> json) {
    return MusicVideosViews(
      moreByArtist: json["more-by-artist"]["data"] == null
          ? null
          : List<MusicVideos>.from(json["more-by-artist"]["data"]
              .map((x) => MusicVideos.fromJson(x))),
      moreByArtistTitle: json["more-by-artist"]["attributes"]["title"],
      moreInGenre: json["more-in-genre"]["data"] == null
          ? null
          : List<MusicVideos>.from(json["more-in-genre"]["data"]
              .map((x) => MusicVideos.fromJson(x))),
      moreInGenreTitle: json["more-in-genre"]["attributes"]["title"],
    );
  }
}
