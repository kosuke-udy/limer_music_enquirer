import 'package:isar/isar.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import 'metadata_info.dart';

export 'metadata_info.dart';

part 'ap_song_metadata.g.dart';

typedef ApSongStandardMetadataInfo = MetadataInfo<ApSongStandardMetadata>;
typedef ApSongClassicalMetadataInfo = MetadataInfo<ApSongClassicalMetadata>;

@collection
class ApSongMetadataOrderSettingCollection {
  ApSongMetadataOrderSettingCollection();

  Id? id;

  bool classicalFirst = false;

  @Enumerated(EnumType.ordinal)
  List<ApSongStandardMetadata> standardValues = ApSongStandardMetadata.values;
  List<bool> standardVisibilities =
      List.filled(ApSongStandardMetadata.values.length, true);

  @Enumerated(EnumType.ordinal)
  List<ApSongClassicalMetadata> classicalValues =
      ApSongClassicalMetadata.values;
  List<bool> classicalVisibilities =
      List.filled(ApSongClassicalMetadata.values.length, true);

  @ignore
  List<MetadataInfo<ApSongStandardMetadata>> get standardInfoList =>
      getMetadataInfoList<ApSongStandardMetadata>(
          standardValues, standardVisibilities);

  @ignore
  List<MetadataInfo<ApSongClassicalMetadata>> get classicalInfoList =>
      getMetadataInfoList<ApSongClassicalMetadata>(
          classicalValues, classicalVisibilities);
}

enum ApSongStandardMetadata {
  albumName(true),
  artistName(true),
  audioVariants(false),
  composerName(false),
  contentRating(true),
  discNumber(true),
  durationInMillis(true),
  genreNames(true),
  hasLyrics(false),
  isAppleDigitalMaster(false),
  isrc(false),
  name(true),
  releaseDate(true),
  trackNumber(true);

  final bool isLibrary;

  const ApSongStandardMetadata(this.isLibrary);

  String? getStringFromSongs(SongsAttributes atr) {
    switch (this) {
      case albumName:
        return atr.albumName;
      case artistName:
        return atr.artistName;
      case audioVariants:
        return atr.audioVariants?.join(", ");
      case composerName:
        return atr.composerName;
      case contentRating:
        return atr.contentRating;
      case discNumber:
        return atr.discNumber?.toString();
      case durationInMillis:
        return _durationInMillisToString(atr.durationInMillis);
      case genreNames:
        return atr.genreNames.join(", ");
      case hasLyrics:
        return atr.hasLyrics ? "Yes" : "No";
      case isAppleDigitalMaster:
        return atr.isAppleDigitalMaster ? "Yes" : "No";
      case isrc:
        return atr.isrc;
      case name:
        return atr.name;
      case releaseDate:
        return atr.releaseDate;
      case trackNumber:
        return atr.trackNumber?.toString();
      default:
        return null;
    }
  }

  String? getStringFromLibrarySongs(LibrarySongsAttributes atr) {
    switch (this) {
      case albumName:
        return atr.albumName;
      case artistName:
        return atr.artistName;
      case contentRating:
        return atr.contentRating;
      case discNumber:
        return atr.discNumber?.toString();
      case durationInMillis:
        return _durationInMillisToString(atr.durationInMillis);
      case genreNames:
        return atr.genreNames.join(", ");
      case name:
        return atr.name;
      case releaseDate:
        return atr.releaseDate;
      case trackNumber:
        return atr.trackNumber?.toString();
      default:
        return null;
    }
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

enum ApSongClassicalMetadata {
  attribution,
  movementCount,
  movementName,
  movementNumber,
  workName;

  String? getStringFromSongs(SongsAttributes atr) {
    switch (this) {
      case attribution:
        return atr.attribution;
      case movementCount:
        return atr.movementCount?.toString();
      case movementName:
        return atr.movementName;
      case movementNumber:
        return atr.movementNumber?.toString();
      case workName:
        return atr.workName;
      default:
        return null;
    }
  }
}
