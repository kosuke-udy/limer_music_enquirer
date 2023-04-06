import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../api/apple_music_api/apple_music_api.dart';
import '../../router/app_router.dart';
import '../../providers/apple_music/apple_music.dart';

class AlbumDetailPage extends ConsumerWidget {
  late final AutoDisposeFutureProvider<AlbumKind> albumProvider;

  AlbumDetailPage.fromTrackId(
    String id, {
    Key? key,
  }) : super(key: key) {
    albumProvider = albumKindFromTrackIdFamily(id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAlbum = ref.watch(albumProvider);
    return PageScaffold(
      topBar: SliverAppBar.medium(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              ref.watch(appRouterProvider).pop();
            },
          ),
          title: Text(
            asyncAlbum.when(
              data: (album) => album.id,
              loading: () => "",
              error: (err, stack) => "",
            ),
          )),
      body: Center(
        child: Text(
          asyncAlbum.when(
            data: (album) => album.id,
            loading: () => "Loading...",
            error: (err, stack) => "Error: $err",
          ),
        ),
      ),
    );
  }
}
