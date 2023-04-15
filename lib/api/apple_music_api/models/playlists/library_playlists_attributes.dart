import 'package:freezed_annotation/freezed_annotation.dart';

import '../common_types/artwork.dart';
import '../common_types/description_attribute.dart';
import '../common_types/play_parameters.dart';
import '../abstracts_base.dart';

part 'library_playlists_attributes.freezed.dart';

@freezed
class LibraryPlaylistsAttributes
    with _$LibraryPlaylistsAttributes
    implements PlaylistKindAttributes {
  const factory LibraryPlaylistsAttributes({
    Artwork? artwork,
    required bool canEdit,
    String? dateAdded,
    DescriptionAttribute? description,
    required bool hasCatalog,
    required String name,
    PlayParameters? playParams,
    required bool isPublic,
    String? lastModifiedDate,
    List<String>? trackTypes, // Extended
  }) = _LibraryPlaylistsAttributes;

  factory LibraryPlaylistsAttributes.fromJson(Map<String, dynamic> json) {
    return LibraryPlaylistsAttributes(
      artwork: json['artwork'] == null
          ? null
          : Artwork.fromJson(json['artwork'] as Map<String, dynamic>),
      canEdit: json['canEdit'] as bool,
      dateAdded: json['dateAdded'] as String?,
      description: json['description'] == null
          ? null
          : DescriptionAttribute.fromJson(
              json['description'] as Map<String, dynamic>),
      hasCatalog: json['hasCatalog'] as bool,
      name: json['name'] as String,
      playParams: json['playParams'] == null
          ? null
          : PlayParameters.fromJson(json['playParams'] as Map<String, dynamic>),
      isPublic: json['isPublic'] as bool,
      lastModifiedDate: json['lastModifiedDate'] as String?,
      trackTypes: (json['trackTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }
}
