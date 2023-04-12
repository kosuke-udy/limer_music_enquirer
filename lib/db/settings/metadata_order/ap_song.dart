import 'package:isar/isar.dart';

part 'ap_song.g.dart';

@collection
class ApSongMetadataOrderSettingCollection {
  ApSongMetadataOrderSettingCollection();

  Id? id;

  List<ApSongMetadataInfo> order = [];
}

@embedded
class ApSongMetadataInfo {
  ApSongMetadataInfo();

  @Enumerated(EnumType.ordinal)
  ApSongMetadataType type = ApSongMetadataType.albumName;

  bool isVisible = false;
}

enum ApSongMetadataType {
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

  bool get isCatalog => catalogValues.contains(this);
  static const catalogValues = [
    audioVariants,
    composerName,
    hasLyrics,
    isAppleDigitalMaster,
    isrc,
  ];

  bool get isClassic => classicValues.contains(this);
  static const classicValues = [
    attribution,
    movementCount,
    movementName,
    movementNumber,
    workName,
  ];
}
