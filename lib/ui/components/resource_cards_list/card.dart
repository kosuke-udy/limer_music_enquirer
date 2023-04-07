import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../common_values/common_values.dart';
import '../../common_parts/common_parts.dart';

class ResourceCard extends HookConsumerWidget {
  final ResourceKind resource;

  late final String name;
  late final String? creatorName;
  late final String? artworkUrl;

  ResourceCard({
    Key? key,
    required this.resource,
  }) : super(key: key) {
    if (AlbumKind.types.contains(resource.type)) {
      final album = resource as AlbumKind;
      name = album.attributes!.name;
      creatorName = album.attributes!.artistName;
      artworkUrl = album.attributes!.artwork?.url100;
    } else if (resource.type is Playlists) {
      final playlist = resource as Playlists;
      name = playlist.attributes!.name;
      creatorName = playlist.attributes!.curatorName;
      artworkUrl = playlist.attributes!.artwork?.url100;
    } else if (resource.type is LibraryPlaylists) {
      final libraryPlaylist = resource as LibraryPlaylists;
      name = libraryPlaylist.attributes!.name;
      creatorName = "Your Library";
      artworkUrl = libraryPlaylist.attributes!.artwork?.url100;
    } else {
      throw Exception('Unknown resource type: ${resource.type}');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);

    return OutlinedCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // RoundedImage.network(
          //   artworkUrl,
          //   size: 100,
          // ),
        ],
      ),
    );
  }
}
