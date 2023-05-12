import 'package:isar/isar.dart';

import 'ap_object_base.dart';

part 'ap_song.g.dart';

@collection
class ApSongMetadataSettingCollection {
  ApSongMetadataSettingCollection();

  Id? id;

  List<ApSongMetadataInfo> order = ApSongMetadataType.defaultOrder
      .map((e) => ApSongMetadataInfo()..type = e)
      .toList();
}

@embedded
class ApSongMetadataInfo implements ApMetadataInfoBase<ApSongMetadataType> {
  ApSongMetadataInfo();

  @override
  @Enumerated(EnumType.ordinal)
  ApSongMetadataType type = ApSongMetadataType.albumName;

  @override
  bool isVisible = false;
}

enum ApSongMetadataType implements ApMetadataEnumBase {
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

  @override
  bool get isCatalogs => catalogValues.contains(this);
  static const catalogValues = [
    audioVariants,
    composerName,
    hasLyrics,
    isAppleDigitalMaster,
    isrc,
  ];

  bool get isClassical => classicalValues.contains(this);
  static const classicalValues = [
    attribution,
    movementCount,
    movementName,
    movementNumber,
    workName,
  ];

  static const defaultOrder = [
    albumName,
    composerName,
    releaseDate,
    genreNames,
    name,
    artistName,
    durationInMillis,
    audioVariants,
    trackNumber,
    discNumber,
    contentRating,
    hasLyrics,
    isAppleDigitalMaster,
    isrc,
    attribution,
    workName,
    movementName,
    movementNumber,
    movementCount,
  ];
}
