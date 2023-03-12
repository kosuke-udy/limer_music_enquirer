import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api/apple_music/am_dio.dart';
import '../../api/apple_music/data/am_track.dart';

final _futureProvider = FutureProvider<List<AmTrack>>(
  (ref) async {
    final amDio = await ref.read(asyncAmDioProvider.future);
    final response = await amDio.get<Map<String, dynamic>>(
      "me/recent/played/tracks",
      queryParameters: {
        "include": [],
        "l": "",
        "limit": 20,
        "offset": "",
        "extend": [],
        "types": ["songs"],
      },
    );
    debugPrint(response.data!.toString());
    return AmTracksResponse.fromJson(response.data!).data;
  },
);

class AmRecentlyPlayed extends ConsumerWidget {
  const AmRecentlyPlayed({
    Key? key,
    required this.ok,
    required this.loading,
    required this.error,
    this.animationDuration = const Duration(milliseconds: 300),
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
  }) : super(key: key);

  final Widget Function(List<AmTrack> tracks) ok;
  final Widget Function() loading;
  final Widget Function(Object err, StackTrace stack) error;

  final Duration animationDuration;
  final Widget Function(Widget child, Animation<double> animation)
      transitionBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedSwitcher(
      duration: animationDuration,
      transitionBuilder: transitionBuilder,
      child: ref.watch(_futureProvider).when(
            data: ok,
            loading: loading,
            error: error,
          ),
    );
  }
}
