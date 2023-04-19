import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../providers/apple_music/history/added_resources.dart';
import '../../providers/apple_music/history/played_songs.dart';
import '../../providers/db/settings/metadata/ap_song.dart';
import '../../translations.g.dart';
import '../common_parts/common_parts.dart';
import '../components/resource_card/view_grid.dart';
import '../components/song_card/list_horizontal.dart';
import '../router/paths.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMetadataSetting = ref.watch(apSongMetadataSettingProvider);
    final isLoading = asyncMetadataSetting.isLoading;
    final hasError = asyncMetadataSetting.hasError;

    return PageScaffold(
      appBarTitle: Text(t.homePage.home),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : hasError
              ? Center(
                  child: Text(asyncMetadataSetting.error.toString()),
                )
              : _afterPreloaded(
                  context,
                  ref,
                  asyncMetadataSetting.value!,
                ),
    );
  }

  Widget _afterPreloaded(
    BuildContext context,
    WidgetRef ref,
    ApSongMetadataSettingCollection metadataSetting,
  ) {
    final asyncRecentlyPlayedSongs = ref.watch(recentlyPlayedSongsProvider);
    final asyncRecentlyAddedResources =
        ref.watch(recentlyAddedResourcesProvider);

    return RefreshableListView(
      onRefresh: () async {
        ref.invalidate(recentlyPlayedSongsProvider);
      },
      children: [
        Area(
          headline: Headline(
            t.homePage.recentlyPlayed,
            onTap: () => context.beamToNamed(appPath.recentlyPlayedTracks),
          ),
          child: asyncRecentlyPlayedSongs.when(
            data: (songs) {
              return SongCardListHorizontal(
                songs: songs.sublist(0, 10),
                metadataSetting: metadataSetting,
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            error: (err, stack) => throw err,
          ),
        ),
        Area(
            headline: Headline(t.homePage.recentlyAdded),
            child: asyncRecentlyAddedResources.when(
              data: (resources) {
                return ResourceCardGridView(
                  resources: resources,
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              error: (err, stack) => throw err,
            )),
      ],
    );
  }
}
