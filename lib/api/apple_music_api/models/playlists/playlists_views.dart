import 'package:freezed_annotation/freezed_annotation.dart';

import '../artists/artists.dart';
import '../../converter/converter.dart';
import 'playlists.dart';

part 'playlists_views.freezed.dart';

@freezed
class PlaylistsViews with _$PlaylistsViews {
  const factory PlaylistsViews({
    List<Artists>? featuredArtists,
    String? featuredArtistsTitle,
    List<Playlists>? moreByCurator,
    String? moreByCuratorTitle,
  }) = _PlaylistsViews;

  factory PlaylistsViews.fromJson(Map<String, dynamic> json) {
    return PlaylistsViews(
      featuredArtists: json["featured-artists"] != null
          ? convertToList(json["featured-artists"])
          : null,
      featuredArtistsTitle: json["featured-artists"]["attributes"]["title"],
      moreByCurator: json["more-by-curator"] != null
          ? convertToList(json["more-by-curator"])
          : null,
      moreByCuratorTitle: json["more-by-curator"]["attributes"]["title"],
    );
  }
}
