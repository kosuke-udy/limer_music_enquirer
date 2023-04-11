import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../../providers/apple_music/providers.dart';
import '../../../providers/db/settings/metadata_order/ap_song_metadata_order.dart';
import '../../../providers/db/settings/ap_storefront.dart';
import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';
import '../../components/components.dart';

class SongKindDetailPage extends HookConsumerWidget {
  /* ---------- Statics ---------- */

  static const _artworkSize = 100.0;

  /* ---------- Properties ---------- */

  final String id;
  final SongKind? data;

  /* ---------- Constructor ---------- */

  const SongKindDetailPage(
    this.id, {
    Key? key,
    this.data,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(apStorefrontSettingProvider).hasValue
        ? _build(context, ref, ref.watch(apStorefrontSettingProvider).value!)
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget _build(
    BuildContext context,
    WidgetRef ref,
    ApStorefrontSettingCollection storefrontSetting,
  ) {
    final apStorefront = storefrontSetting.list[0];
    final detailProvider = songKindDetailProvider(
      id: id,
      storefront: apStorefront.countryId,
      languageTag: apStorefront.languageTag,
      data: data,
    );

    final songDetail = ref.watch(detailProvider);

    final common = ref.watch(commonValuesProvider);

    return PageScaffold(
      appBarTitle: const Text("Detail"),
      body: RefreshableListView(
        onRefresh: () async {
          ref.invalidate(detailProvider);
        },
        children: [
          Area(
            child: songDetail.when(
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
                      AttributesTableCard(
                        keyAreaWidth: _artworkSize,
                        attributes: _getAttributesMap(song),
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

Map<String, String?> _getAttributesMap(SongKind songKind) {
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
