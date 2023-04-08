import 'package:isar/isar.dart';

import '../../../api/apple_music_api/apple_music_api.dart';

part 'ap_song_metadata.g.dart';

@embedded
class ApSongDisplayMetadataSettings {
  const ApSongDisplayMetadataSettings({
    this.order = SongMetadata.catalogValues,
    this.classicalOrder = SongMetadata.classicalValues,
  });

  @Enumerated(EnumType.ordinal)
  final List<SongMetadata> order;

  @Enumerated(EnumType.ordinal)
  final List<SongMetadata> classicalOrder;
}

enum SongMetadata {
  albumName,
  artistName,
  attribution,
  audioVariants,
  composerName,
  contentRating,
  discNumber,
  durationInMillis,
  genreNames,
  hasLyrics,
  isAppleDigitalMaster,
  isrc,
  movementCount,
  movementName,
  movementNumber,
  name,
  releaseDate,
  trackNumber,
  workName;

  static const List<SongMetadata> libraryValues = [
    albumName,
    artistName,
    contentRating,
    discNumber,
    durationInMillis,
    genreNames,
    name,
    releaseDate,
    trackNumber,
  ];

  static const List<SongMetadata> catalogValues = [
    albumName,
    artistName,
    contentRating,
    discNumber,
    durationInMillis,
    genreNames,
    hasLyrics,
    isAppleDigitalMaster,
    isrc,
    name,
    releaseDate,
    trackNumber,
  ];

  static const List<SongMetadata> classicalValues = [
    attribution,
    composerName,
    movementCount,
    movementName,
    movementNumber,
    workName,
  ];

  String? getStringFromSongs(SongsAttributes atr) {
    if (catalogValues.contains(this) || classicalValues.contains(this)) {
      switch (this) {
        case SongMetadata.albumName:
          return atr.albumName;
        case SongMetadata.artistName:
          return atr.artistName;
        case SongMetadata.attribution:
          return atr.attribution;
        case SongMetadata.audioVariants:
          return atr.audioVariants?.join(", ");
        case SongMetadata.composerName:
          return atr.composerName;
        case SongMetadata.contentRating:
          return atr.contentRating;
        case SongMetadata.discNumber:
          return atr.discNumber?.toString();
        case SongMetadata.durationInMillis:
          return _durationInMillisToString(atr.durationInMillis);
        case SongMetadata.genreNames:
          return atr.genreNames.join(", ");
        case SongMetadata.hasLyrics:
          return atr.hasLyrics ? "Yes" : "No";
        case SongMetadata.isAppleDigitalMaster:
          return atr.isAppleDigitalMaster ? "Yes" : "No";
        case SongMetadata.isrc:
          return atr.isrc;
        case SongMetadata.movementCount:
          return atr.movementCount?.toString();
        case SongMetadata.movementName:
          return atr.movementName;
        case SongMetadata.movementNumber:
          return atr.movementNumber?.toString();
        case SongMetadata.name:
          return atr.name;
        case SongMetadata.releaseDate:
          return atr.releaseDate;
        case SongMetadata.trackNumber:
          return atr.trackNumber?.toString();
        case SongMetadata.workName:
          return atr.workName;
        default:
          return null;
      }
    }
    return null;
  }

  String? getStringFromLibrarySongs(LibrarySongsAttributes atr) {
    if (libraryValues.contains(this)) {
      switch (this) {
        case SongMetadata.albumName:
          return atr.albumName;
        case SongMetadata.artistName:
          return atr.artistName;
        case SongMetadata.contentRating:
          return atr.contentRating;
        case SongMetadata.discNumber:
          return atr.discNumber?.toString();
        case SongMetadata.durationInMillis:
          return _durationInMillisToString(atr.durationInMillis);
        case SongMetadata.genreNames:
          return atr.genreNames.join(", ");
        case SongMetadata.name:
          return atr.name;
        case SongMetadata.releaseDate:
          return atr.releaseDate;
        case SongMetadata.trackNumber:
          return atr.trackNumber?.toString();
        default:
          return null;
      }
    }
    return null;
  }

  String _durationInMillisToString(int durationInMillis) {
    int totalSeconds = durationInMillis ~/ 1000;
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    if (hours > 0) {
      return "${hours.toString()}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    } else {
      return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    }
  }
}
