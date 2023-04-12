import '../../../api/apple_music_api/models/models.dart';
import '../../../db/settings/metadata_order/ap_song.dart';

import '../general/duration.dart';

String? getApSongStandardMetadata(
  SongKind songKind,
  ApSongStandardMetadataInfo info,
) {
  switch (info.type) {
    // Common
    case ApSongStandardMetadataType.albumName:
      return songKind.attributes!.albumName;
    case ApSongStandardMetadataType.artistName:
      return songKind.attributes!.artistName;
    case ApSongStandardMetadataType.contentRating:
      return songKind.attributes!.contentRating;
    case ApSongStandardMetadataType.discNumber:
      return songKind.attributes!.discNumber?.toString();
    case ApSongStandardMetadataType.durationInMillis:
      return durationInMillisToString(songKind.attributes!.durationInMillis);
    case ApSongStandardMetadataType.genreNames:
      return songKind.attributes!.genreNames.join(', ');
    case ApSongStandardMetadataType.name:
      return songKind.attributes!.name;
    case ApSongStandardMetadataType.releaseDate:
      return songKind.attributes!.releaseDate;
    case ApSongStandardMetadataType.trackNumber:
      return songKind.attributes!.trackNumber?.toString();
    default:
      switch (songKind.type) {
        case ResourceType.songs:
          final song = songKind as Songs;
          switch (info.type) {
            case ApSongStandardMetadataType.audioVariants:
              return song.attributes!.audioVariants?.join(', ');
            case ApSongStandardMetadataType.composerName:
              return song.attributes!.composerName;
            case ApSongStandardMetadataType.hasLyrics:
              return song.attributes!.hasLyrics ? 'Yes' : 'No';
            case ApSongStandardMetadataType.isAppleDigitalMaster:
              return song.attributes!.isAppleDigitalMaster ? 'Yes' : 'No';
            case ApSongStandardMetadataType.isrc:
              return song.attributes!.isrc;
            default:
              return null;
          }
        default:
          return null;
      }
  }
}
