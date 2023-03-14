import 'package:flutter/material.dart';

import '../../api/apple_music/models/am_track.dart';
import '../ui_constants.dart';
import 'common_parts/custom_texts.dart';
import 'common_parts/m3_cards.dart';
import 'common_parts/rounded_image.dart';

const double _artworkSize = 100;

class TrackDetailCard extends StatelessWidget {
  const TrackDetailCard({
    Key? key,
    required this.track,
  }) : super(key: key);

  final AmTrack track;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        UiConstants.of(context).horizontalPadding,
        0,
        UiConstants.of(context).horizontalPadding,
        UiConstants.of(context).verticalPadding,
      ),
      child: FilledCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: UiConstants.of(context).horizontalPadding,
                vertical: UiConstants.of(context).verticalPadding,
              ),
              child: Row(
                children: [
                  RoundedImage.network(
                    url: track.artwork.url300,
                    width: _artworkSize,
                    height: _artworkSize,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: UiConstants.of(context).horizontalPadding),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          track.name,
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          track.artistName,
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: UiConstants.of(context).verticalPadding,
                horizontal: UiConstants.of(context).horizontalPadding,
              ),
              child: EllipsisText(
                track.hasComposer
                    ? "Composer: ${track.artistName}"
                    : "No Composer Data",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
