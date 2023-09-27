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
import '../../../providers/db/settings/ap_storefront.dart';
import '../../../translations.g.dart';
import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';
import '../../components/song_card/card_unit.dart';

final nowPlayingIdProvider = FutureProvider((ref) async {
  return ref.watch(
    recentlyPlayedSongsProvider.selectAsync((list) => list[0].id),
  );
});

<<<<<<< Updated upstream
class SongDetailPage extends HookConsumerWidget {
=======
class SongDetailPage extends ConsumerWidget {
>>>>>>> Stashed changes
  /* ---------- Fixed Values ---------- */

  static const _artworkAreaSize = 100.0;
  static const _mainCardMaxLines = 3;

  /* ---------- Properties ---------- */

  final bool isNowPlaying;
  final String? id;

  /* ---------- Constructor ---------- */

  const SongDetailPage({
    Key? key,
    this.id,
    this.isNowPlaying = false,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Settings
    final asyncStorefrontSetting = ref.watch(apStorefrontSettingProvider);
    final asyncStandardMetadataSetting =
        ref.watch(apSongMetadataSettingProvider);
    final isLoading = asyncStorefrontSetting.isLoading ||
        asyncStandardMetadataSetting.isLoading;
    final hasError = asyncStorefrontSetting.hasError ||
        asyncStandardMetadataSetting.hasError;

    return PageScaffold(
<<<<<<< Updated upstream
      onBackButtonPressed: context.canBeamBack ? context.beamBack : null,
=======
      isAllowedToPopScreen: !isNowPlaying,
      onWillPop: () {
        Beamer.of(context).beamBack();
        return false;
      },
>>>>>>> Stashed changes
      appBarTitle: Text(isNowPlaying ? t.nav.nowPlaying : t.nav.songsDetail),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : hasError
              ? Center(
                  child: Text(asyncStorefrontSetting.error.toString()),
                )
              : id != null
                  ? _afterPreloaded(
                      context,
                      ref,
                      id!,
                      asyncStorefrontSetting.value!,
                      asyncStandardMetadataSetting.value!,
                    )
                  : ref.watch(nowPlayingIdProvider).when(
                        loading: () => const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                        error: (error, stackTrace) => throw error,
                        data: (songId) => _afterPreloaded(
                          context,
                          ref,
                          songId,
                          asyncStorefrontSetting.value!,
                          asyncStandardMetadataSetting.value!,
                        ),
                      ),
    );
  }

  Widget _afterPreloaded(
    BuildContext context,
    WidgetRef ref,
    String songId,
    ApStorefrontSettingCollection storefrontSetting,
    ApSongMetadataSettingCollection metadataSetting,
  ) {
    final apStorefront = storefrontSetting.list[0];
    final songDetailProvider = songKindDetailProvider(
      id: songId,
      storefront: apStorefront.countryId,
      languageTag: apStorefront.languageTag,
    );

    final common = ref.watch(commonValuesProvider);

    return RefreshableListView(
      children: [
        ref.watch(songDetailProvider).when(
              loading: () => const SizedBox.shrink(),
              error: (error, stackTrace) => throw error,
              data: (songDetail) => Area(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: common.size.insetsMedium,
                    horizontal: common.size.screenPadding,
                  ),
                  child: SongCardUnit(
                    song: songDetail,
                    artworkAreaSize: _artworkAreaSize,
                    mainCardMaxLines: _mainCardMaxLines,
                    metadataSetting: metadataSetting,
                  ),
                ),
              ),
            ),
      ],
    );
  }
}
