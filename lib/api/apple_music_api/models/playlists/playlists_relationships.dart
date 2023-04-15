import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter/converter.dart';
import '../common_types/common_types.dart';
import '../base_abstracts.dart';
import 'library_playlists.dart';

part 'playlists_relationships.freezed.dart';

@freezed
class PlaylistsRelationships
    with _$PlaylistsRelationships
    implements PlaylistKindRelationships {
  const factory PlaylistsRelationships({
    // Relationship<CuratorType>? curator,
    Relationship<LibraryPlaylists>? library,
    Relationship<TrackKind>? tracks,
  }) = _PlaylistsRelationships;

  factory PlaylistsRelationships.fromJson(Map<String, dynamic> json) {
    return PlaylistsRelationships(
      // curator: json["curator"] != null
      //     ? Relationship.fromJson(json["curator"])
      //     : null,
      library: json["library"] != null
          ? Relationship.fromJson(json["library"])
          : null,
      tracks:
          json["tracks"] != null ? Relationship.fromJson(json["tracks"]) : null,
    );
  }
}
