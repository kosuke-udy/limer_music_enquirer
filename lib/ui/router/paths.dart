const appPath = AppPath();

class AppPath {
  const AppPath();

  final home = '/home';

  final recentlyPlayedTracks = '/recently-played-tracks';

  final songDetailPattern = '/song-detail';
  String songDetail({String? id}) => id != null && id.isNotEmpty
      ? '$songDetailPattern?id=$id'
      : songDetailPattern;

  final albumDetailPattern = '/album-detail';
  String albumDetail(String id) => '$albumDetailPattern?id=$id';

  final search = '/search';

  final settings = '/settings';

  final settingsApStorefront = '/settings/apple-music-storefront';

  final settingsSongMetadataOrder = '/settings/song-metadata-order';
}
