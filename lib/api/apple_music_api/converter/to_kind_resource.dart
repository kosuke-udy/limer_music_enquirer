part of converter;

T convertToResourceKind<T extends ResourceKind>(
  Map<String, dynamic> json,
) {
  if (T == TrackKind) {
    return convertToTrackKind(json) as T;
  } else if (T == TrackListKind) {
    return convertToTrackListKind(json) as T;
  } else if (T == AlbumKind) {
    return convertToAlbumKind(json) as T;
  } else if (T == ArtistKind) {
    return convertToArtistKind(json) as T;
  } else if (T == MusicVideoKind) {
    return convertToMusicVideoKind(json) as T;
  } else if (T == PlaylistKind) {
    return convertToPlaylistKind(json) as T;
  } else if (T == SongKind) {
    return convertToSongKind(json) as T;
  } else if (T == Storefronts) {
    return Storefronts.fromJson(json) as T;
  } else if (json["type"] == "albums") {
    return Albums.fromJson(json) as T;
  } else if (json["type"] == "library-albums") {
    return LibraryAlbums.fromJson(json) as T;
  } else if (json["type"] == "artists") {
    return Artists.fromJson(json) as T;
  } else if (json["type"] == "library-artists") {
    return LibraryArtists.fromJson(json) as T;
  } else if (json["type"] == "music-videos") {
    return MusicVideos.fromJson(json) as T;
  } else if (json["type"] == "library-music-videos") {
    return LibraryMusicVideos.fromJson(json) as T;
  } else if (json["type"] == "playlists") {
    return Playlists.fromJson(json) as T;
  } else if (json["type"] == "library-playlists") {
    return LibraryPlaylists.fromJson(json) as T;
  } else if (json["type"] == "songs") {
    return Songs.fromJson(json) as T;
  } else if (json["type"] == "library-songs") {
    return LibrarySongs.fromJson(json) as T;
  } else {
    throw NotSupportedTypeError(json["type"]);
  }
}
