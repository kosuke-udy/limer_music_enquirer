import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../../translations.g.dart';
import '../../common_parts/m3_cards.dart';
import '../../common_values/common_values.dart';
import '../../data_converter/general/color.dart';
import '../../router/paths.dart';

class ResourceListCard extends HookConsumerWidget {
  /* ---------- Fixed Values ---------- */

  static const double _artworkWidthProporation = 0.2;

  /* ---------- Properties ---------- */

  final ResourceKind resource;

  /* ---------- Constructor ---------- */

  const ResourceListCard({
    Key? key,
    required this.resource,
  }) : super(key: key);

  /* ---------- Build ---------- */

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
      bgColor = artwork?.bgColor?.tune(params: TuningParams.resourceCardDark);
      artworkWidget = FilledCard(
        elevation: 4,
        child: artwork != null
            ? Image.network(
                artwork.url500,
              )
            : AspectRatio(
                aspectRatio: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
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

    // Artwork width
    final cardWidth =
        MediaQuery.of(context).size.width - common.size.screenPadding;
    final artworkWidth = cardWidth * _artworkWidthProporation;

    return FilledCard(
      color: bgColor,
      child: GestureDetector(
        onTap: () {
          switch (resource.type) {
            case ResourceType.albums:
              context.beamToNamed(
                appPath.albumDetail(resource.id),
              );
              break;
            // case ResourceType.playlists:
            //   context.beamToNamed(
            //     appPath.playlistDetail((resource as Playlists).id),
            //   );
            //   break;
            default:
              break;
          }
        },
        child: Row(
          children: [
            SizedBox(
              width: artworkWidth,
              child: artworkWidget,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: common.size.insetsLarge,
                  vertical: common.size.insetsSmall,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: common.textStyle.cardTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
            ),
          ],
        ),
      ),
    );
  }
}
