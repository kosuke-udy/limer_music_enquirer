import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api/apple_music/am_dio.dart';
import '../../api/apple_music/data/am_track.dart';
import '../../util/app_logger.dart';

final _logger = AppLogger.get("am_recently_played.dart");

class AmRecentlyPlayed extends ConsumerWidget {
  const AmRecentlyPlayed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTrackTiles = ref.watch(_futureProvider).whenData(
          (tracks) => tracks
              .map((e) => ListTile(
                    title: Text(e.name),
                    subtitle: Text(e.artistName),
                  ))
              .toList(),
        );
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: asyncTrackTiles.when(
        data: (tiles) {
          return Column(
            children: tiles,
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => Text(error.toString()),
      ),
    );
  }
}

final _futureProvider = FutureProvider<List<AmTrack>>(
  (ref) async {
    final amDio = await ref.read(asyncAmDioProvider.future);
    final response = await amDio.get<Map<String, dynamic>>(
      "me/recent/played/tracks",
      queryParameters: {
        "include": [],
        "l": "",
        "limit": 10,
        "offset": "",
        "extend": [],
        "types": ["songs"],
      },
    );
    return AmTracksResponse.fromJson(response.data!).data;
  },
);
