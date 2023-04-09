import 'package:isar/isar.dart';

import 'metadata_display/ap_song_metadata.dart';

part 'metadata_display.g.dart';

@collection
class MetadataDisplaySettings {
  MetadataDisplaySettings({
    this.id = Isar.autoIncrement,
    this.apSongs = const ApSongMetadataDisplaySettings(),
  });

  Id id;

  ApSongMetadataDisplaySettings apSongs;
}
