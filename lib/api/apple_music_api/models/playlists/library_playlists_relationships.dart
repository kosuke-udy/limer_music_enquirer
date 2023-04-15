import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter/converter.dart';
import '../abstracts_base.dart';
import 'playlists.dart';

part 'library_playlists_relationships.freezed.dart';

@freezed
class LibraryPlaylistsRelationships
    with _$LibraryPlaylistsRelationships
    implements PlaylistKindRelationships {
  const factory LibraryPlaylistsRelationships({
    List<Playlists>? catalog,
    String? catalogTitle,
    List<TrackKind>? tracks,
    String? tracksTitle,
  }) = _LibraryPlaylistsRelationships;

  factory LibraryPlaylistsRelationships.fromJson(Map<String, dynamic> json) {
    return LibraryPlaylistsRelationships(
      catalog: json["catalog"] != null ? convertToList(json["catalog"]) : null,
      catalogTitle: json["catalog"]["attributes"]["title"],
      tracks: json["tracks"] != null ? convertToList(json["tracks"]) : null,
      tracksTitle: json["tracks"]["attributes"]["title"],
    );
  }
}
