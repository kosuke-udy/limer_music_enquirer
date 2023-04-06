part of converter;

TrackKind convertToTrackKind(Map<String, dynamic> json) {
  final typeData = json["type"];
  if (typeData == "songs" || typeData == "library-songs") {
    return convertToSongKind(json);
  } else if (typeData == "music-videos" || typeData == "library-music-videos") {
    return convertToMusicVideoKind(json);
  } else {
    throw NotSupportedTypeError(typeData);
  }
}

TrackListKind convertToTrackListKind(Map<String, dynamic> json) {
  final typeData = json["type"];
  if (typeData == "albums" || typeData == "library-albums") {
    return convertToAlbumKind(json);
  } else if (typeData == "playlists" || typeData == "library-playlists") {
    return convertToPlaylistKind(json);
  } else {
    throw NotSupportedTypeError(typeData);
  }
}

/*
  If json["type"] is "library-xxx":
      If json["relationships"]["catalog"]["data"][0] exists:
        the input is a catalog object and added to user's library.
          => Convert it as a catalog object.
      else:
        the input is not a catalog object,
        or a catalogs but the relationship had not been included in the response.
          => Convert as a library object.

  If json["type"] is NOT "library-xxx":
      the input is a catalog object and NEVER added to user's library.
        => Convert as a catalog object.
*/

AlbumKind convertToAlbumKind(Map<String, dynamic> json) {
  final typeData = json["type"];
  if (typeData == "albums") {
    return Albums.fromJson(json);
  } else if (typeData == "library-albums") {
    final catalogData =
        json["relationships"]?["catalog"]?["data"] as List<dynamic>?;
    if (catalogData != null && catalogData.isNotEmpty) {
      return Albums.fromJson(catalogData[0]);
    } else {
      return LibraryAlbums.fromJson(json);
    }
  } else {
    throw NotSupportedTypeError(typeData);
  }
}

ArtistKind convertToArtistKind(Map<String, dynamic> json) {
  final typeData = json["type"];
  if (typeData == "artists") {
    return Artists.fromJson(json);
  } else if (typeData == "library-artists") {
    final catalogData =
        json["relationships"]?["catalog"]?["data"] as List<dynamic>?;
    if (catalogData != null && catalogData.isNotEmpty) {
      return Artists.fromJson(catalogData[0]);
    } else {
      return LibraryArtists.fromJson(json);
    }
  } else {
    throw NotSupportedTypeError(typeData);
  }
}

MusicVideoKind convertToMusicVideoKind(Map<String, dynamic> json) {
  final typeData = json["type"];
  if (typeData == "music-videos") {
    return MusicVideos.fromJson(json);
  } else if (typeData == "library-music-videos") {
    final catalogData =
        json["relationships"]?["catalog"]?["data"] as List<dynamic>?;
    if (catalogData != null && catalogData.isNotEmpty) {
      return MusicVideos.fromJson(catalogData[0]);
    } else {
      return LibraryMusicVideos.fromJson(json);
    }
  } else {
    throw NotSupportedTypeError(typeData);
  }
}

PlaylistKind convertToPlaylistKind(Map<String, dynamic> json) {
  final typeData = json["type"];
  if (typeData == "playlists") {
    return Playlists.fromJson(json);
  } else if (typeData == "library-playlists") {
    final catalogData =
        json["relationships"]?["catalog"]?["data"] as List<dynamic>?;
    if (catalogData != null && catalogData.isNotEmpty) {
      return Playlists.fromJson(catalogData[0]);
    } else {
      return LibraryPlaylists.fromJson(json);
    }
  } else {
    throw NotSupportedTypeError(typeData);
  }
}

SongKind convertToSongKind(Map<String, dynamic> json) {
  final typeData = json["type"];
  if (typeData == "songs") {
    return Songs.fromJson(json);
  } else if (typeData == "library-songs") {
    final catalogData =
        json["relationships"]?["catalog"]?["data"] as List<dynamic>?;
    if (catalogData != null && catalogData.isNotEmpty) {
      return Songs.fromJson(catalogData[0]);
    } else {
      return LibrarySongs.fromJson(json);
    }
  } else {
    throw NotSupportedTypeError(typeData);
  }
}
