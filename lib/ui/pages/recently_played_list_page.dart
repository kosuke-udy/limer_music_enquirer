import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../providers/apple_music/providers.dart';
import '../../../router/routes.dart';
import '../components/components.dart';

class RecentlyPlayedListPage extends ConsumerWidget {
  const RecentlyPlayedListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentlyPlayedSongs = ref.watch(recentlyPlayedSongsProvider);

    return PageScaffold(
      // topBar: SliverAppBar.medium(
      //   floating: true,
      //   pinned: true,
      //   snap: true,
      //   stretch: true,
      //   title: const Text("Recently Played"),
      // ),
      appBarTitle: const Text("Recently Played"),
      body: RefreshableListView(
        onRefresh: () async => ref.invalidate(recentlyPlayedSongsProvider),
        children: [
          Area(
            child: recentlyPlayedSongs.when(
              data: (songs) {
                return SongCardListVertical(songs);
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (err, stack) => Center(
                child: Text(err.toString()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
