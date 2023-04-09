import 'package:isar/isar.dart';

import '../../../api/apple_music_api/apple_music_api.dart';

part 'ap_song_metadata.g.dart';

@embedded
class ApSongMetadataOrderSetting {
  const ApSongMetadataOrderSetting({
    this.catalog = ApSongMetadata.catalogValues,
    this.classical = ApSongMetadata.classicalValues,
  });

  @Enumerated(EnumType.ordinal)
  final List<ApSongMetadata> catalog;

  @Enumerated(EnumType.ordinal)
  final List<ApSongMetadata> classical;
}

enum ApSongMetadata {
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

  static const List<ApSongMetadata> libraryValues = [
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

  static const List<ApSongMetadata> catalogValues = [
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

  static const List<ApSongMetadata> classicalValues = [
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
        case ApSongMetadata.albumName:
          return atr.albumName;
        case ApSongMetadata.artistName:
          return atr.artistName;
        case ApSongMetadata.attribution:
          return atr.attribution;
        case ApSongMetadata.audioVariants:
          return atr.audioVariants?.join(", ");
        case ApSongMetadata.composerName:
          return atr.composerName;
        case ApSongMetadata.contentRating:
          return atr.contentRating;
        case ApSongMetadata.discNumber:
          return atr.discNumber?.toString();
        case ApSongMetadata.durationInMillis:
          return _durationInMillisToString(atr.durationInMillis);
        case ApSongMetadata.genreNames:
          return atr.genreNames.join(", ");
        case ApSongMetadata.hasLyrics:
          return atr.hasLyrics ? "Yes" : "No";
        case ApSongMetadata.isAppleDigitalMaster:
          return atr.isAppleDigitalMaster ? "Yes" : "No";
        case ApSongMetadata.isrc:
          return atr.isrc;
        case ApSongMetadata.movementCount:
          return atr.movementCount?.toString();
        case ApSongMetadata.movementName:
          return atr.movementName;
        case ApSongMetadata.movementNumber:
          return atr.movementNumber?.toString();
        case ApSongMetadata.name:
          return atr.name;
        case ApSongMetadata.releaseDate:
          return atr.releaseDate;
        case ApSongMetadata.trackNumber:
          return atr.trackNumber?.toString();
        case ApSongMetadata.workName:
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
        case ApSongMetadata.albumName:
          return atr.albumName;
        case ApSongMetadata.artistName:
          return atr.artistName;
        case ApSongMetadata.contentRating:
          return atr.contentRating;
        case ApSongMetadata.discNumber:
          return atr.discNumber?.toString();
        case ApSongMetadata.durationInMillis:
          return _durationInMillisToString(atr.durationInMillis);
        case ApSongMetadata.genreNames:
          return atr.genreNames.join(", ");
        case ApSongMetadata.name:
          return atr.name;
        case ApSongMetadata.releaseDate:
          return atr.releaseDate;
        case ApSongMetadata.trackNumber:
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
