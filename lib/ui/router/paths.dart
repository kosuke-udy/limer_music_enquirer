// const homePath = '/home';
// const recentlyPlayedTracksPath = '/recently-played-songs';
// const songDetailPath = '/song-detail/:id';
// const searchPath = '/search';
// const settingsPath = '/settings';
// const settingsApStorefrontPath = '/settings/apple-music-storefront';
// const settingsSongMetadataOrderPath = '/settings/song-metadata-order';

const appPath = AppPath();

class AppPath {
  const AppPath();

  final home = '/home';

  final recentlyPlayedTracks = '/recently-played-tracks';

  final songDetailPattern = '/song-detail';
  String songDetail(String id) => '$songDetailPattern?id=$id';

  final search = '/search';

  final settings = '/settings';

  final settingsApStorefront = '/settings/apple-music-storefront';

  final settingsSongMetadataOrder = '/settings/song-metadata-order';
}
