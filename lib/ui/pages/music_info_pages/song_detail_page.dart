import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../../providers/apple_music/providers.dart';
import '../../../providers/db/settings/metadata_order/ap_song_metadata_order.dart';
import '../../../providers/db/settings/ap_storefront.dart';
import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';
import '../../components/components.dart';

class SongDetailPage extends HookConsumerWidget {
  /* ---------- Statics ---------- */

  static const _artworkSize = 100.0;

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
        ref.watch(apSongStandardMetadataOrderSettingProvider);
    final asyncClassicalMetadataSetting =
        ref.watch(apSongClassicalMetadataOrderSettingProvider);

    final isLoading = asyncStorefrontSetting.isLoading ||
        asyncStandardMetadataSetting.isLoading ||
        asyncClassicalMetadataSetting.isLoading;

    final hasError = asyncStorefrontSetting.hasError ||
        asyncStandardMetadataSetting.hasError ||
        asyncClassicalMetadataSetting.hasError;

    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
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
                asyncClassicalMetadataSetting.value!,
              );
  }

  Widget _afterSettingLoaded(
    BuildContext context,
    WidgetRef ref,
    ApStorefrontSettingCollection storefrontSetting,
    List<ApSongStandardMetadataInfo> standardMetadataOrder,
    List<ApSongClassicalMetadataInfo> classicalMetadataOrder,
  ) {
    final apStorefront = storefrontSetting.list[0];
    final detailProvider = songKindDetailProvider(
      id: id,
      storefront: apStorefront.countryId,
      languageTag: apStorefront.languageTag,
      data: data,
    );

    final asyncSongDetail = ref.watch(detailProvider);

    final common = ref.watch(commonValuesProvider);

    return PageScaffold(
      appBarTitle: const Text("Detail"),
      body: RefreshableListView(
        onRefresh: () async {
          ref.invalidate(detailProvider);
        },
        children: [
          Area(
            child: asyncSongDetail.when(
              data: (song) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: common.size.insetsLarge,
                  ),
                  child: Column(
                    children: [
                      Area(
                        child: SongTitleCard(
                          name: song.attributes!.name,
                          artistName: song.attributes!.artistName,
                          artworkUrl: song.attributes!.artwork.url300,
                          artworkSize: _artworkSize,
                          bgColorBase: song.attributes!.artwork.bgColor,
                          fullDisplayed: true,
                        ),
                      ),
                      MetadataTableCard(
                        keyAreaWidth: _artworkSize,
                        metadataMap: _getMetadataMap(song),
                        bgColorBase: song.attributes!.artwork.bgColor,
                      ),
                    ],
                  ),
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
        ],
      ),
    );
  }
}

Map<String, String?> _getMetadataMap(SongKind songKind) {
  if (songKind.type == ResourceType.songs) {
    final song = songKind as Songs;
    return {
      'Album': song.attributes!.albumName,
      'Artist': song.attributes!.artistName,
      'Composer': song.attributes!.composerName,
      'Duration': Duration(milliseconds: song.attributes!.durationInMillis)
          .toString()
          .split('.')
          .first,
      'Genres': song.attributes!.genreNames.join(', '),
      'Lyrics': song.attributes!.hasLyrics.toString(),
      'Apple Digital Master': song.attributes!.isAppleDigitalMaster.toString(),
      'Track Number': song.attributes!.trackNumber.toString(),
    };
  } else {
    final song = songKind as LibrarySongs;
    return {
      'Album': song.attributes!.albumName,
      'Artist': song.attributes!.artistName,
      'Duration': song.attributes!.durationInMillis.toString(),
      'Genres': song.attributes!.genreNames.join(', '),
      'Track Number': song.attributes!.trackNumber.toString(),
    };
  }
}
