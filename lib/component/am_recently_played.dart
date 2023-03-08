import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/apple_music/request/am_recently_played_tracks.dart';
import '../util/app_logger.dart';

final _logger = AppLogger.get("am_recently_played.dart");

final _provider =
    asyncAmRecentlyPlayedTracksProvider(AmTracksQueries(types: ["songs"]));

class AmRecentlyPlayed extends ConsumerWidget {
  const AmRecentlyPlayed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTracks = ref.watch(_provider);
    return asyncTracks.when(
      data: (tracks) {
        final track = tracks.first;
        return Column(
          children: [
            Text(track.name),
            Text(track.artistName),
          ],
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text(error.toString()),
    );
  }
}
