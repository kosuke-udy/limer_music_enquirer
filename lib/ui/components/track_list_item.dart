part of track_list;

const _rowHeight = 60.0;
const _artworkSize = 64.0;
const _forwardIconSize = 11.0;
const _forwardIconVerticalSpace = _forwardIconSize * (6.5 / 24.0);

class TrackListItem extends ConsumerWidget {
  const TrackListItem({
    Key? key,
    required this.track,
  }) : super(key: key);

  final AmTrack track;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(uiConstantsProvider);
    final titleTextStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          overflow: TextOverflow.ellipsis,
        );
    final subtitleTextStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
          color: constants.color.subtitle,
          overflow: TextOverflow.ellipsis,
        );

    final titlePainter = TextPainter(
      text: TextSpan(
        text: track.name,
        style: titleTextStyle,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    late double artworkWidth, artworkHeight;
    if (track.artwork.width > track.artwork.height) {
      artworkWidth = _artworkSize;
      artworkHeight =
          _artworkSize * (track.artwork.height / track.artwork.width);
    } else {
      artworkHeight = _artworkSize;
      artworkWidth =
          _artworkSize * (track.artwork.width / track.artwork.height);
    }

    return OutlinedCard(
      margin: EdgeInsets.fromLTRB(
        constants.size.insetsLarge,
        0,
        constants.size.insetsMedium,
        constants.size.insetsLarge,
      ),
      child: Row(
        children: [
          SizedBox(
            width: artworkWidth,
            height: artworkHeight,
            child: Image.network(
              track.artwork.url100,
            ),
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
                  style: titleTextStyle,
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth / 2,
                          ),
                          child: Text(
                            track.artistName,
                            style: subtitleTextStyle,
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth / 2,
                          ),
                          // Display composer name label
                          child: Text(
                            track.hasComposer
                                ? " / Composer: ${track.composerName!}"
                                : " / No Composer Data",
                            style: subtitleTextStyle,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(width: constants.size.insetsMedium),
          Icon(
            Icons.arrow_forward_ios_rounded,
            // color: Theme.of(context)
            //     .colorScheme
            //     .onSurface
            //     .withOpacity(1 - constants.opacity.focus),
            color: Theme.of(context).colorScheme.onSurface,
            size: 16.5,
          ),
          SizedBox(width: constants.size.insetsMedium),
        ],
      ),
    );
  }
}
