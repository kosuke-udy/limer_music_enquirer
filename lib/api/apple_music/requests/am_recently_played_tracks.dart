import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../am_dio.dart';
import '../models/am_track.dart';

final asyncAmRecentlyPlayedTracksProvider =
    FutureProvider.family<List<AmTrack>, AmTracksQueries>(
  (ref, queries) async {
    final amDio =
        await ref.read(asyncAmDioProvider.selectAsync((data) => data));
    final response = await amDio.get<Map<String, dynamic>>(
      "me/recent/played/tracks",
      queryParameters: queries.toMap(),
    );
    return AmTracksResponse.fromJson(response.data!).data;
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
