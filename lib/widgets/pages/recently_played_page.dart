import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/track_detail_card.dart';
import '../components/track_list.dart';
import '../data_widgets/am_recently_played.dart';
import '../layout/app_layout.dart';

class RecentlyPlayedPage extends ConsumerWidget {
  const RecentlyPlayedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBody(
      topBar: const AppTopBar(
        titleData: 'Recently Played',
      ),
      contents: AppContents(
        child: AmRecentlyPlayed(
          ok: (tracks) {
            final lastPlayed = tracks.first;
            return Column(
              children: [
                TrackDetailCard(track: lastPlayed),
                TrackList(tracks: tracks),
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
