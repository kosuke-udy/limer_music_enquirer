import 'models.dart';

enum ResourceType {
  // Albums
  albums("albums", Albums),
  libraryAlbums("library-albums", LibraryAlbums),

  // Artists
  artists("artists", Artists),
  libraryArtists("library-artists", LibraryArtists),

  // Music Videos
  musicVideos("music-videos", MusicVideos),
  libraryMusicVideos("library-music-videos", LibraryMusicVideos),

  // Songs
  songs("songs", Songs),
  librarySongs("library-songs", LibrarySongs),

  // // Apple Music Stations
  // stations("stations"),

  // Playlists
  playlists("playlists", Playlists),
  libraryPlaylists("library-playlists", LibraryPlaylists);

  // // Ratings
  // ratings("ratings"),

  // // Music Genres
  // genres("genres"),

  // // Activities
  // activities("activities"),

  // // Curators
  // appleCurators("apple-curators"),
  // curators("curators"),

  // // Record Labels
  // recordLabels("record-labels"),

  // // Recommendations
  // personalRecommendations("personal-recommendations");

  static const classes = [
    Albums,
    LibraryAlbums,
    Artists,
    LibraryArtists,
    MusicVideos,
    LibraryMusicVideos,
    Songs,
    LibrarySongs,
    // Stations,
    Playlists,
    LibraryPlaylists,
    // Ratings,
    // Genres,
    // Activities,
    // AppleCurators,
    // Curators,
    // RecordLabels,
    // PersonalRecommendations,
  ];

  static const jsonValues = [
    "albums",
    "library-albums",
    "artists",
    "library-artists",
    "music-videos",
    "library-music-videos",
    "songs",
    "library-songs",
    // "stations",
    "playlists",
    "library-playlists",
    // "ratings",
    // "genres",
    // "activities",
    // "apple-curators",
    // "curators",
    // "record-labels",
    // "personal-recommendations",
  ];

  final String value;
  final Type type;

  const ResourceType(this.value, this.type);

  factory ResourceType.fromJson(String value) {
    return ResourceType.values.firstWhere((e) => e.value == value);
  }
}
