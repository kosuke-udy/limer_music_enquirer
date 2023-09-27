import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:hooks_riverpod/hooks_riverpod.dart';
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> Stashed changes
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../../providers/apple_music/providers.dart';
import '../../../providers/db/settings/metadata/ap_song.dart';
import '../../../translations.g.dart';
import '../../common_parts/common_parts.dart';
import '../../components/components.dart';

class RecentlyPlayedTracksPage extends ConsumerWidget {
  const RecentlyPlayedTracksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMetadataSetting = ref.watch(apSongMetadataSettingProvider);
    final isLoading = asyncMetadataSetting.isLoading;
    final hasError = asyncMetadataSetting.hasError;

    return PageScaffold(
<<<<<<< Updated upstream
      onBackButtonPressed: context.canBeamBack ? context.beamBack : null,
=======
      isAllowedToPopScreen: false,
>>>>>>> Stashed changes
      appBarTitle: Text(t.nav.recentlyPlayedSongs),
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
    final recentlyPlayedSongs = ref.watch(recentlyPlayedSongsProvider);

    return RefreshableListView(
      onRefresh: () async => ref.invalidate(recentlyPlayedSongsProvider),
      children: [
        Area(
          child: recentlyPlayedSongs.when(
            data: (songs) {
              return SongCardListVertical(
                songs: songs,
                metadataSetting: metadataSetting,
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            error: (err, stack) => Center(
              child: Text(err.toString()),
            ),
          ),
        ),
      ],
    );
  }
}
