import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../../translations.g.dart';
import '../../common_parts/m3_cards.dart';
import '../../common_parts/rounded_image.dart';
import '../../common_values/common_values.dart';
import '../../data_converter/general/color.dart';

class ResourceListCard extends HookConsumerWidget {
  final ResourceKind resource;

  const ResourceListCard({
    Key? key,
    required this.resource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Data from resource
    final String title, subtitle;
    final Widget artworkWidget;
    final Color? bgColor;

    if (TrackListKind.types.contains(resource.type)) {
      // Common to TrackListKind
      // title, bgColor, artworkWidget
      final trackList = resource as TrackListKind;
      final artwork = trackList.attributes!.artwork;
      title = trackList.attributes!.name;
      bgColor = artwork?.bgColor?.tune(params: TuningParams.darkAccent);
      artworkWidget = artwork != null
          ? RoundedImage.network(
              artwork.url500,
            )
          : Container(
              color: Colors.grey,
            );

      // Branching for each type
      // subtitle
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
      color: bgColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          artworkWidget,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: common.size.insetsSmall,
              vertical: common.size.insetsSmall,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: common.textStyle.cardTitle,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  strutStyle: StrutStyle.disabled,
                  textWidthBasis: TextWidthBasis.longestLine,
                ),
                Text(
                  subtitle,
                  style: common.textStyle.cardSubtitle,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
