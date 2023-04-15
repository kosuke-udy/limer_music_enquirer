import 'package:freezed_annotation/freezed_annotation.dart';

import '../artists/artists.dart';
import '../common_types/common_types.dart';
import 'playlists.dart';

part 'playlists_views.freezed.dart';

@freezed
class PlaylistsViews with _$PlaylistsViews {
  const factory PlaylistsViews({
    TitledView<Artists>? featuredArtists,
    TitledView<Playlists>? moreByCurator,
  }) = _PlaylistsViews;

  factory PlaylistsViews.fromJson(Map<String, dynamic> json) {
    return PlaylistsViews(
      featuredArtists: json["featured-artists"] != null
          ? TitledView.fromJson(json["featured-artists"])
          : null,
      moreByCurator: json["more-by-curator"] != null
          ? TitledView.fromJson(json["more-by-curator"])
          : null,
    );
  }
}
