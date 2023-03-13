import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'layout/app_layout.dart';
import 'data/am_recently_played.dart';
import 'component/track_list.dart';
import 'component/track_detail_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBody(
      contents: AppContents(
        child: AmRecentlyPlayed(
          ok: (tracks) {
            final lastPlayed = tracks.first;
            return Column(
              children: [
                TrackDetailCard(track: lastPlayed),
                const SizedBox(height: 16),
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
