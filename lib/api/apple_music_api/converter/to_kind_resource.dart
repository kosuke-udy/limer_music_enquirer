part of converter;

T convertToResourceKind<T extends ResourceKind>(
  Map<String, dynamic> json,
) {
  switch (json["type"]) {
    case "albums":
      return Albums.fromJson(json) as T;
    case "library-albums":
      return LibraryAlbums.fromJson(json) as T;
    case "artists":
      return Artists.fromJson(json) as T;
    case "library-artists":
      return LibraryArtists.fromJson(json) as T;
    case "music-videos":
      return MusicVideos.fromJson(json) as T;
    case "library-music-videos":
      return LibraryMusicVideos.fromJson(json) as T;
    case "playlists":
      return Playlists.fromJson(json) as T;
    case "library-playlists":
      return LibraryPlaylists.fromJson(json) as T;
    case "songs":
      return Songs.fromJson(json) as T;
    case "library-songs":
      return LibrarySongs.fromJson(json) as T;
    case "storefronts":
      return Storefronts.fromJson(json) as T;
    default:
      throw NotSupportedTypeError(json["type"]);
  }
}
