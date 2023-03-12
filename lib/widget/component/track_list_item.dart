part of track_list;

class TrackListItem extends StatelessWidget {
  const TrackListItem({
    Key? key,
    required this.track,
  }) : super(key: key);

  final AmTrack track;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = UiConstants.of(context).horizontalPadding;

    Widget textTrackName(String title) => Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        );

    Widget textArtistName(String subtitle) => Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        );

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: _verticalPadding,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  getAmArtworkUrl(
                    track,
                    maxLength: 100,
                  ),
                  fit: BoxFit.contain,
                  height: _artworkHeight,
                  width: _artworkHeight,
                ),
              ),
              SizedBox(width: horizontalPadding),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textTrackName(track.name),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Row(
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth / 2,
                              ),
                              child: textArtistName(track.artistName),
                            ),
                            track.composerName != null
                                ? Container(
                                    constraints: BoxConstraints(
                                      maxWidth: constraints.maxWidth / 2,
                                    ),
                                    // Display composer name label
                                    child: textArtistName(
                                      " / ${track.composerName!}",
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: horizontalPadding - _forwardIconVerticalSpace),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                size: _forwardIconSize,
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          indent: horizontalPadding * 2 + _artworkHeight,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
        ),
      ],
    );
  }
}
