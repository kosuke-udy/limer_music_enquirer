import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../util/app_logger.dart';
import '../am_dio.dart';
import '../data/am_track.dart';

final _logger = AppLogger.get("am_recently_played_tracks.dart");

final asyncAmRecentlyPlayedTracksProvider =
    FutureProvider.family<List<AmTrack>, AmTracksQueries>(
  (ref, queries) async {
    final amDio =
        await ref.read(asyncAmDioProvider.selectAsync((data) => data));
    final response = await amDio.get<Map<String, dynamic>>(
      "me/recent/played/tracks",
      queryParameters: queries.toMap(),
    );
    final List<AmTrack> ret = AmTracksResponse.fromJson(response.data!).data;
    return ret;
  },
);

class AmTracksQueries {
  final List<String>? include;
  final String? l;
  final int? limit;
  final int? offset;
  final List<String>? extend;
  final List<String> types;

  AmTracksQueries({
    this.include,
    this.l,
    this.limit,
    this.offset,
    this.extend,
    required this.types,
  });

  Map<String, dynamic> toMap() {
    return {
      "include": include,
      "l": l,
      "limit": limit,
      "offset": offset,
      "extend": extend,
      "types": types,
    };
  }
}
