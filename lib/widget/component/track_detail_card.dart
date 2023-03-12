import 'package:flutter/material.dart';

import '../../api/apple_music/data/am_track.dart';

class TrackDetailCard extends StatelessWidget {
  const TrackDetailCard({
    Key? key,
    required this.track,
  }) : super(key: key);

  final AmTrack track;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        getAmArtworkUrl(track, maxLength: 64),
        width: 64,
        height: 64,
        fit: BoxFit.cover,
      ),
      title: Text(track.name),
      subtitle: Text(track.artistName),
      trailing: const Icon(Icons.more_vert),
    );
  }
}
