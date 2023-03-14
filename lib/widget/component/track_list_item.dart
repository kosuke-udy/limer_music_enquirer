part of track_list;

const _rowHeight = 60.0;
const _artworkSize = 46.0;
const _forwardIconSize = 11.0;
const _forwardIconVerticalSpace = _forwardIconSize * (6.5 / 24.0);

class TrackListItem extends StatelessWidget {
  const TrackListItem({
    Key? key,
    required this.track,
  }) : super(key: key);

  final AmTrack track;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = UiConstants.of(context).horizontalPadding;

    final titleTextStyle = Theme.of(context).textTheme.bodyMedium;
    final subtitleTextStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
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

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: _verticalPadding,
          ),
          child: Row(
            children: [
              RoundedImage.network(
                url: track.artwork.url100,
                width: artworkWidth,
                height: artworkHeight,
              ),
              SizedBox(
                width: horizontalPadding,
                height: _rowHeight,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EllipsisText(
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
                              child: EllipsisText(
                                track.artistName,
                                style: subtitleTextStyle,
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth / 2,
                              ),
                              // Display composer name label
                              child: EllipsisText(
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
          indent: horizontalPadding * 2 + _artworkSize,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
        ),
      ],
    );
  }
}
