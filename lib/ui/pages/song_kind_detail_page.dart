import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../providers/apple_music/providers.dart';
import '../../providers/db/providers.dart';
// import '../../router/routes.dart';
import '../common_methods/color_extension.dart';
import '../common_parts/common_parts.dart';
import '../components/components.dart';
import '../common_values/common_values.dart';

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
    final common = ref.watch(commonValuesProvider);

    final storefronts = ref.watch(userStorefrontsProvider);
    final detailProvider = songKindDetailProvider(
      id: id,
      storefront: "us",
      languageTag: "en-US",
      data: data,
    );

    final songDetail = ref.watch(detailProvider);

    return PageScaffold(
      appBarTitle: Text(
        songDetail.when(
          data: (data) => data.attributes!.name,
          loading: () => 'Loading...',
          error: (err, stack) => 'Error',
        ),
      ),
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
//     required String albumName,
//     required String artistName,
//     String? attribution, // Classical only
//     List<String>? audioVariants, // Extended
//     String? composerName,
//     String? contentRating,
//     int? discNumber,
//     required int durationInMillis,
//     EditorialNotes? editorialNotes,
//     required List<String> genreNames,
//     required bool hasLyrics,
//     required bool isAppleDigitalMaster,
//     String? isrc,
//     int? movementCount, // Classical only
//     String? movementName, // Classical only
//     int? movementNumber, // Classical only
//     required String name,
//     PlayParameters? playParams,
//     String? releaseDate,
//     int? trackNumber,
//     String? workName, // Classical only
    final song = songKind as Songs;
    return {
      'Album': song.attributes!.albumName,
      'Artist': song.attributes!.artistName,
      'Composer': song.attributes!.composerName,
      // 'Duration': song.attributes!.durationInMillis.toString(),
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
    // String? albumName,
    // required String artistName,
    // required Artwork artwork,
    // String? contentRating,
    // int? discNumber,
    // required int durationInMillis,
    // required List<String> genreNames,
    // required String name,
    // PlayParameters? playParams,
    // String? releaseDate,
    // int? trackNumber,
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