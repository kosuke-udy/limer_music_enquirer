library track_list;

import 'package:flutter/material.dart';

import '../../api/apple_music/data/am_track.dart';
import '../ui_constants.dart';

part 'track_list_item.dart';

const _verticalPadding = 4.0;
const _artworkHeight = 46.0;
const _forwardIconSize = 16.0;
const _forwardIconVerticalSpace = _forwardIconSize * (6.5 / 24.0);

class TrackList extends StatelessWidget {
  const TrackList({
    Key? key,
    required this.tracks,
  }) : super(key: key);

  final List<AmTrack> tracks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Divider(
        //   height: 1,
        //   thickness: 1,
        //   indent: _horizontalPadding,
        //   color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
        // ),
        ...tracks.map((e) => TrackListItem(track: e)).toList(),
      ],
    );
  }
}