import '../../../api/apple_music_api/models/models.dart';
import '../../../db/settings/metadata_order/ap_song.dart';

String? getApSongClassicalMetadata(
  SongKind songKind,
  ApSongClassicalMetadataInfo info,
) {
  switch (songKind.type) {
    case ResourceType.songs:
      final song = songKind as Songs;
      switch (info.type) {
        case ApSongClassicalMetadataType.attribution:
          return song.attributes!.attribution;
        case ApSongClassicalMetadataType.movementCount:
          return song.attributes!.movementCount?.toString();
        case ApSongClassicalMetadataType.movementName:
          return song.attributes!.movementName;
        case ApSongClassicalMetadataType.movementNumber:
          return song.attributes!.movementNumber?.toString();
        case ApSongClassicalMetadataType.workName:
          return song.attributes!.workName;
        default:
          return null;
      }
    default:
      return null;
  }
}
