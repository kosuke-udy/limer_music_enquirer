library track_list;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api/apple_music/models/am_track.dart';
import '../ui_constants/ui_constants.dart';
import 'common_parts/common_parts.dart';

part 'track_list_item.dart';

const _verticalPadding = 4.0;

class TrackList extends ConsumerWidget {
  const TrackList({
    Key? key,
    required this.tracks,
    this.showTopDivider = false,
  }) : super(key: key);

  final List<AmTrack> tracks;
  final bool showTopDivider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(uiConstantsProvider);

    return Column(
      children: [
        showTopDivider
            ? Divider(
                height: 1,
                thickness: 1,
                indent: constants.size.insetsLarge,
                color: constants.color.divider,
              )
            : Container(),
        ...tracks.map((e) => TrackListItem(track: e)).toList(),
      ],
    );
  }
}
