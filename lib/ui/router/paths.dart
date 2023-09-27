const appPath = AppPath();

class AppPath {
  const AppPath();

  final home = '/home';

  final recentlyPlayedTracks = '/recently-played-tracks';

<<<<<<< Updated upstream
  final songDetailPattern = '/song-detail';
  String songDetail({String? id}) => id != null && id.isNotEmpty
      ? '$songDetailPattern?id=$id'
      : songDetailPattern;
=======
  final nowPlaying = '/now-playing';

  final songDetail = '/now-playing/song-detail';
  String songDetailWithQuery({String? id}) =>
      id != null && id.isNotEmpty ? '$songDetail?id=$id' : songDetail;
>>>>>>> Stashed changes

  final albumDetailPattern = '/album-detail';
  String albumDetail(String id) => '$albumDetailPattern?id=$id';

  final search = '/search';

  final settings = '/settings';

  final settingsApStorefront = '/settings/apple-music-storefront';

  final settingsSongMetadataOrder = '/settings/song-metadata-order';
}
