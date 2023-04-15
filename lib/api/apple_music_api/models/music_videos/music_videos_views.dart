import 'package:freezed_annotation/freezed_annotation.dart';

import '../common_types/common_types.dart';
import 'music_videos.dart';

part 'music_videos_views.freezed.dart';

@freezed
class MusicVideosViews with _$MusicVideosViews {
  const factory MusicVideosViews({
    TitledView<MusicVideos>? moreByArtist,
    TitledView<MusicVideos>? moreInGenre,
  }) = _MusicVideosViews;

  factory MusicVideosViews.fromJson(Map<String, dynamic> json) {
    return MusicVideosViews(
      moreByArtist: json["moreByArtist"] != null
          ? TitledView<MusicVideos>.fromJson(json["moreByArtist"])
          : null,
      moreInGenre: json["moreInGenre"] != null
          ? TitledView<MusicVideos>.fromJson(json["moreInGenre"])
          : null,
    );
  }
}
