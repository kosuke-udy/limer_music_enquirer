import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter/converter.dart';
import '../abstracts_base.dart';
import 'library_playlists.dart';

part 'playlists_relationships.freezed.dart';

@freezed
class PlaylistsRelationships
    with _$PlaylistsRelationships
    implements PlaylistKindRelationships {
  const factory PlaylistsRelationships({
    // List<CuratorType>? curator,
    List<LibraryPlaylists>? library,
    List<TrackKind>? tracks,
  }) = _PlaylistsRelationships;

  factory PlaylistsRelationships.fromJson(Map<String, dynamic> json) {
    return PlaylistsRelationships(
      // curator: json["curator"] != null
      //     ? convertToList(json["curator"])
      //     : null,
      library: json["library"] != null ? convertToList(json["library"]) : null,
      tracks: json["tracks"] != null ? convertToList(json["tracks"]) : null,
    );
  }
}
