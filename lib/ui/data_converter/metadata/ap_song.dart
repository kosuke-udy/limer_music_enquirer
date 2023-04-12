import '../../../api/apple_music_api/models/models.dart';
import '../../../db/settings/metadata_order/ap_song.dart';

import '../general/duration.dart';

String? getApSongMetadataValue(
  SongKind songKind,
  ApSongMetadataInfo info,
) {
  switch (info.type) {
    // Common
    case ApSongMetadataType.albumName:
      return songKind.attributes!.albumName;
    case ApSongMetadataType.artistName:
      return songKind.attributes!.artistName;
    case ApSongMetadataType.contentRating:
      return songKind.attributes!.contentRating;
    case ApSongMetadataType.discNumber:
      return songKind.attributes!.discNumber?.toString();
    case ApSongMetadataType.durationInMillis:
      return durationInMillisToString(songKind.attributes!.durationInMillis);
    case ApSongMetadataType.genreNames:
      return songKind.attributes!.genreNames.join(', ');
    case ApSongMetadataType.name:
      return songKind.attributes!.name;
    case ApSongMetadataType.releaseDate:
      return songKind.attributes!.releaseDate;
    case ApSongMetadataType.trackNumber:
      return songKind.attributes!.trackNumber?.toString();
    default:
      switch (songKind.type) {
        case ResourceType.songs:
          final song = songKind as Songs;
          switch (info.type) {
            case ApSongMetadataType.attribution:
              return song.attributes!.attribution;
            case ApSongMetadataType.audioVariants:
              return song.attributes!.audioVariants?.join(', ');
            case ApSongMetadataType.composerName:
              return song.attributes!.composerName;
            case ApSongMetadataType.hasLyrics:
              return song.attributes!.hasLyrics ? 'Yes' : 'No';
            case ApSongMetadataType.isAppleDigitalMaster:
              return song.attributes!.isAppleDigitalMaster ? 'Yes' : 'No';
            case ApSongMetadataType.isrc:
              return song.attributes!.isrc;
            case ApSongMetadataType.movementCount:
              return song.attributes!.movementCount?.toString();
            case ApSongMetadataType.movementName:
              return song.attributes!.movementName;
            case ApSongMetadataType.movementNumber:
              return song.attributes!.movementNumber?.toString();
            case ApSongMetadataType.workName:
              return song.attributes!.workName;
            default:
              return null;
          }
        default:
          return null;
      }
  }
}
