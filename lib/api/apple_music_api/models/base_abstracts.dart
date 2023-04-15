import '../models/common_types/common_types.dart';
import 'resource_type.dart';

export 'resource_type.dart';

abstract class ResourceKind {
  String get id;
  ResourceType get type;
  String? get href;
}

/* =============== TrackKind =============== */

abstract class TrackKind implements ResourceKind {
  static const List<ResourceType> types = [
    ResourceType.songs,
    ResourceType.librarySongs,
    ResourceType.musicVideos,
    ResourceType.libraryMusicVideos,
  ];

  TrackKindAttributes? get attributes;
  TrackKindRelationships? get relationships;
}

abstract class TrackKindAttributes {
  String? get albumName;
  String get artistName;
  Artwork get artwork;
  String? get contentRating;
  int get durationInMillis;
  List<String> get genreNames;
  String get name;
  PlayParameters? get playParams;
  String? get releaseDate;
  int? get trackNumber;
}

abstract class TrackKindRelationships {}

/* ---------- SongKind ---------- */

abstract class SongKind implements TrackKind {
  static const List<ResourceType> types = [
    ResourceType.songs,
    ResourceType.librarySongs,
  ];

  @override
  SongKindAttributes? get attributes;
  @override
  SongKindRelationships? get relationships;
}

abstract class SongKindAttributes implements TrackKindAttributes {
  int? get discNumber;
}

abstract class SongKindRelationships implements TrackKindRelationships {
  Relationship<AlbumKind>? get albums;
  Relationship<ArtistKind>? get artists;
}

/* ---------- MusicVideoKind ---------- */

abstract class MusicVideoKind implements TrackKind {
  static const List<ResourceType> types = [
    ResourceType.musicVideos,
    ResourceType.libraryMusicVideos,
  ];

  @override
  MusicVideoKindAttributes? get attributes;
  @override
  MusicVideoKindRelationships? get relationships;
}

abstract class MusicVideoKindAttributes implements TrackKindAttributes {}

abstract class MusicVideoKindRelationships implements TrackKindRelationships {
  Relationship<ArtistKind>? get artists;
}

/* =============== TrackListKind =============== */

abstract class TrackListKind implements ResourceKind {
  static const List<ResourceType> types = [
    ResourceType.albums,
    ResourceType.libraryAlbums,
    ResourceType.playlists,
    ResourceType.libraryPlaylists,
  ];

  TrackListKindAttributes? get attributes;
  TrackListKindRelationships? get relationships;
}

abstract class TrackListKindAttributes {
  Artwork? get artwork;
  String get name;
  PlayParameters? get playParams;
}

abstract class TrackListKindRelationships {
  Relationship<TrackKind>? get tracks;
}

/* ---------- AlbumKind ---------- */

abstract class AlbumKind implements TrackListKind {
  static const List<ResourceType> types = [
    ResourceType.albums,
    ResourceType.libraryAlbums,
  ];

  @override
  AlbumKindAttributes? get attributes;
  @override
  AlbumKindRelationships? get relationships;
}

abstract class AlbumKindAttributes implements TrackListKindAttributes {
  String get artistName;
  String? get contentRating;
  String? get dateAdded;
  List<String> get genreNames;
  String? get releaseDate;
  int get trackCount;
}

abstract class AlbumKindRelationships implements TrackListKindRelationships {}

/* ---------- PlaylistKind ---------- */

abstract class PlaylistKind implements TrackListKind {
  static const List<ResourceType> types = [
    ResourceType.playlists,
    ResourceType.libraryPlaylists,
  ];

  @override
  PlaylistKindAttributes? get attributes;
  @override
  PlaylistKindRelationships? get relationships;
}

abstract class PlaylistKindAttributes implements TrackListKindAttributes {
  DescriptionAttribute? get description;
  String? get lastModifiedDate;
  List<String>? get trackTypes;
}

abstract class PlaylistKindRelationships
    implements TrackListKindRelationships {}

/* =============== Others =============== */

/* ---------- ArtistKind ---------- */

abstract class ArtistKind implements ResourceKind {
  static const List<ResourceType> types = [
    ResourceType.artists,
    ResourceType.libraryArtists
  ];

  ArtistKindAttributes? get attributes;
  ArtistKindRelationships? get relationships;
}

abstract class ArtistKindAttributes {
  String get name;
}

abstract class ArtistKindRelationships {}
