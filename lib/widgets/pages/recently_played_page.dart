import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/components.dart';
import '../data_widgets/am_recently_played.dart';
import '../layout/app_layout.dart';

class RecentlyPlayedPage extends ConsumerWidget {
  const RecentlyPlayedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBody(
      contents: AppContents(
        child: AmRecentlyPlayed(
          ok: (tracks) {
            final lastPlayed = tracks.first;
            final list = tracks.sublist(1);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Headline("Last Played Track"),
                TrackDetailCard(track: lastPlayed),
                const Headline("Recently Played"),
                TrackList(tracks: list),
              ],
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (err, stack) => Center(
            child: Text(err.toString()),
          ),
        ),
      ),
    );
  }
}
