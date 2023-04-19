import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../../translations.g.dart';
import '../../common_parts/m3_cards.dart';
import '../../common_parts/rounded_image.dart';
import '../../common_values/common_values.dart';

class ResourceCard extends HookConsumerWidget {
  final ResourceKind resource;

  const ResourceCard({
    Key? key,
    required this.resource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String title, subtitle;
    final Widget artworkWidget;

    if (TrackListKind.types.contains(resource.type)) {
      final trackList = resource as TrackListKind;

      title = trackList.attributes!.name;

      final artwork = trackList.attributes!.artwork;
      artworkWidget = artwork != null
          ? RoundedImage.network(
              artwork.url500,
            )
          : Container(
              color: Colors.grey,
            );

      if (AlbumKind.types.contains(resource.type)) {
        subtitle = (resource as AlbumKind).attributes!.artistName;
      } else if (resource.type == ResourceType.playlists) {
        subtitle = (resource as Playlists).attributes!.curatorName;
      } else {
        subtitle = t.general.playlist;
      }
    } else {
      throw Exception('Not implemented');
    }

    final common = ref.watch(commonValuesProvider);

    return FilledCard(
      margin: EdgeInsets.only(
        right: common.size.screenPadding,
        bottom: common.size.screenPadding,
      ),
      child: artworkWidget,
    );
  }
}
