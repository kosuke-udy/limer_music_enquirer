import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:limer_music_enquirer/router/routes.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../components/components.dart';
import '../../providers/apple_music/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentlySongs = ref.watch(recentlyPlayedSongsProvider);
    // final recentlyResources = ref.watch(recentlyPlayedResourcesProvider);

    return PageScaffold(
      // topBar: SliverAppBar.medium(
      //   floating: true,
      //   pinned: true,
      //   snap: true,
      //   stretch: false,
      //   title: const Text("Home"),
      // ),
      appBarTitle: const Text("Home"),
      body: RefreshableListView(
        onRefresh: () async {
          ref.invalidate(recentlyPlayedSongsProvider);
        },
        children: [
          Area(
            headline: Headline(
              "Recently Played Songs",
              onTap: () => RecentlyPlayedSongsPageRoute().push(context),
            ),
            child: recentlySongs.when(
              data: (songs) {
                return SongCardListHorizontal(songs.sublist(0, 10));
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (err, stack) => Center(
                child: Text(err.toString()),
              ),
            ),
          ),
          // Area(
          //   headline: const Headline("Recently Played Resources"),
          //   child: recentlyResources.when(
          //     data: (resources) {
          //       // return AlbumCardList(
          //       //   albums.map((e) => AlbumCard(album: e)).toList(),
          //       // );
          //       return const Center(
          //         child: Text("Not implemented yet"),
          //       );
          //     },
          //     loading: () => const Center(
          //       child: CircularProgressIndicator(),
          //     ),
          //     error: (err, stack) => Center(
          //       child: Text(err.toString()),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
