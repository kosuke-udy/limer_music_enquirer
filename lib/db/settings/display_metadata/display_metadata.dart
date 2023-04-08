import 'package:isar/isar.dart';

import 'ap_song_metadata.dart';

part 'display_metadata.g.dart';

@collection
class DisplayMetadataSettings {
  DisplayMetadataSettings({
    this.id = Isar.autoIncrement,
    this.apSongs = const ApSongDisplayMetadataSettings(),
  });

  Id id;

  ApSongDisplayMetadataSettings apSongs;
}
