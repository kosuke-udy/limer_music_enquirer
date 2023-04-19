import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../../providers/apple_music/providers.dart';
import '../../../providers/db/settings/metadata/ap_song.dart';
import '../../../providers/db/settings/ap_storefront.dart';
import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';
import '../../components/song_card/card_unit.dart';

class SongDetailPage extends HookConsumerWidget {
  /* ---------- Fixed Values ---------- */

  static const _artworkSize = 100.0;
  static const _mainCardMaxLines = 3;

  /* ---------- Properties ---------- */

  final String id;
  final SongKind? data;

  /* ---------- Constructor ---------- */

  const SongDetailPage(
    this.id, {
    Key? key,
    this.data,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncStorefrontSetting = ref.watch(apStorefrontSettingProvider);
    final asyncStandardMetadataSetting =
        ref.watch(apSongMetadataSettingProvider);

    final isLoading = asyncStorefrontSetting.isLoading ||
        asyncStandardMetadataSetting.isLoading;
    final hasError = asyncStorefrontSetting.hasError ||
        asyncStandardMetadataSetting.hasError;

    return PageScaffold(
      onBackButtonPressed: context.beamBack,
      appBarTitle: const Text("Detail"),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : hasError
              ? Center(
                  child: Text(asyncStorefrontSetting.error.toString()),
                )
              : _afterSettingLoaded(
                  context,
                  ref,
                  asyncStorefrontSetting.value!,
                  asyncStandardMetadataSetting.value!,
                ),
    );
  }

  Widget _afterSettingLoaded(
    BuildContext context,
    WidgetRef ref,
    ApStorefrontSettingCollection storefrontSetting,
    ApSongMetadataSettingCollection metadataSetting,
  ) {
    final apStorefront = storefrontSetting.list[0];
    final songDetailProvider = songKindDetailProvider(
      id: id,
      storefront: apStorefront.countryId,
      languageTag: apStorefront.languageTag,
      data: data,
    );

    final common = ref.watch(commonValuesProvider);

    return RefreshableListView(
      children: [
        Area(
          child: ref.watch(songDetailProvider).when(
                loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                data: (songDetail) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: common.size.insetsLarge,
                  ),
                  child: SongCardUnit(
                    song: songDetail,
                    artworkSize: _artworkSize,
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
