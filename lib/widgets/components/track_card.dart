import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api/apple_music/models/am_track.dart';
import '../ui_constants/ui_constants.dart';
import 'common_parts/common_parts.dart';

const double _artworkSize = 80.0;

class TrackCard extends ConsumerWidget {
  const TrackCard({
    Key? key,
    required this.track,
  }) : super(key: key);

  final AmTrack track;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(uiConstantsProvider);
    return FilledCard(
      margin: EdgeInsets.fromLTRB(
        constants.size.insetsLarge,
        0,
        constants.size.insetsMedium,
        constants.size.insetsLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(
              constants.size.insetsMedium,
            ),
            child: Row(
              children: [
                RoundedImage.network(
                  url: track.artwork.url300,
                  width: _artworkSize,
                  height: _artworkSize,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width: constants.size.insetsLarge,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        track.name,
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        track.artistName,
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        track.hasComposer
                            ? "Composer: ${track.composerName!}"
                            : "No Composer Data",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: constants.color.subtitle(context)),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: constants.size.insetsMedium,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  // color: Theme.of(context)
                  //     .colorScheme
                  //     .onSurface
                  //     .withOpacity(1 - constants.opacity.focus),
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 16.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
