part of converter;

T convertToResourceKind<T extends ResourceKind>(
  Map<String, dynamic> json,
) {
  switch (T) {
    case Albums:
      return Albums.fromJson(json) as T;
    case LibraryAlbums:
      return LibraryAlbums.fromJson(json) as T;
    case Artists:
      return Artists.fromJson(json) as T;
    case LibraryArtists:
      return LibraryArtists.fromJson(json) as T;
    case MusicVideos:
      return MusicVideos.fromJson(json) as T;
    case LibraryMusicVideos:
      return LibraryMusicVideos.fromJson(json) as T;
    case Playlists:
      return Playlists.fromJson(json) as T;
    case LibraryPlaylists:
      return LibraryPlaylists.fromJson(json) as T;
    case Songs:
      return Songs.fromJson(json) as T;
    case LibrarySongs:
      return LibrarySongs.fromJson(json) as T;
    case Storefronts:
      return Storefronts.fromJson(json) as T;
    case TrackKind:
      return convertToTrackKind(json) as T;
    case TrackListKind:
      return convertToTrackListKind(json) as T;
    case AlbumKind:
      return convertToAlbumKind(json) as T;
    case ArtistKind:
      return convertToArtistKind(json) as T;
    case MusicVideoKind:
      return convertToMusicVideoKind(json) as T;
    case PlaylistKind:
      return convertToPlaylistKind(json) as T;
    case SongKind:
      return convertToSongKind(json) as T;
    default:
      throw NotSupportedTypeError(json["type"]);
  }
}
