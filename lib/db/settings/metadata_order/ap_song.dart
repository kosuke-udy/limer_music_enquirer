import 'package:isar/isar.dart';

import '../../../api/apple_music_api/apple_music_api.dart';

part 'ap_song.g.dart';

@collection
class ApSongMetadataOrderSettingCollection {
  ApSongMetadataOrderSettingCollection();

  Id? id;

  bool classicalFirst = false;

  List<ApSongStandardMetadataInfo> standardInfoList = [];
  List<ApSongClassicalMetadataInfo> classicalInfoList = [];
}

@embedded
class ApSongStandardMetadataInfo {
  ApSongStandardMetadataInfo();

  @Enumerated(EnumType.ordinal)
  ApSongStandardMetadataType type = ApSongStandardMetadataType.albumName;

  bool isVisible = false;
}

@embedded
class ApSongClassicalMetadataInfo {
  ApSongClassicalMetadataInfo();

  @Enumerated(EnumType.ordinal)
  ApSongClassicalMetadataType type = ApSongClassicalMetadataType.attribution;

  bool isVisible = false;
}

enum ApSongStandardMetadataType {
  albumName,
  artistName,
  audioVariants,
  composerName,
  contentRating,
  discNumber,
  durationInMillis,
  genreNames,
  hasLyrics,
  isAppleDigitalMaster,
  isrc,
  name,
  releaseDate,
  trackNumber;

  static const catalogValues = [
    audioVariants,
    composerName,
    hasLyrics,
    isAppleDigitalMaster,
    isrc,
  ];
}

enum ApSongClassicalMetadataType {
  attribution,
  movementCount,
  movementName,
  movementNumber,
  workName;
}
