import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:hooks_riverpod/hooks_riverpod.dart';
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> Stashed changes
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../../providers/apple_music/detail/album_kind.dart';
import '../../../providers/db/settings/ap_storefront.dart';

class AlbumDetailPage extends ConsumerWidget {
  /* ---------- Properties ---------- */

  final String id;

  /* ---------- Constructor ---------- */

  const AlbumDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncStorefrontSetting = ref.watch(apStorefrontSettingProvider);
    final asyncAlbumKindDetail = asyncStorefrontSetting.when(
      data: (data) {
        return ref.watch(albumKindDetailProvider(
          id: id,
          storefront: data.list[0].countryId,
          languageTag: data.list[0].languageTag,
        ));
      },
      loading: () => const AsyncValue.loading(),
      error: (err, stack) => AsyncValue.error(err, stack),
    );

    final isLoading =
        asyncStorefrontSetting.isLoading || asyncAlbumKindDetail.isLoading;
    final hasError =
        asyncStorefrontSetting.hasError || asyncAlbumKindDetail.hasError;

    return PageScaffold(
<<<<<<< Updated upstream
      appBarTitle: const Text("Album Detail"),
      onBackButtonPressed: () => context.beamBack(),
=======
      isAllowedToPopScreen: true,
      onWillPop: Beamer.of(context).beamBack,
      appBarTitle: const Text("Album Detail"),
>>>>>>> Stashed changes
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : hasError
              ? Center(
                  child: Text(asyncStorefrontSetting.error.toString()),
                )
              : _afterPreloaded(
                  context,
                  ref,
                  asyncAlbumKindDetail.value!,
                ),
    );
  }

  Widget _afterPreloaded(
    BuildContext context,
    WidgetRef ref,
    AlbumKind albumKind,
  ) {
    return Container();
  }
}
