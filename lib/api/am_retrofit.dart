import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'am_dio.dart';
import 'data/am_track.dart';

part 'am_retrofit.g.dart';

@Riverpod(keepAlive: true)
class AsyncAmRetrofit extends _$AsyncAmRetrofit {
  @override
  Future<AmRetrofit> build() async {
    final amDio = await ref.watch(asyncAmDioProvider.future);
    return AmRetrofit(amDio);
  }
}

@RestApi(baseUrl: "<https://api.music.apple.com/v1/>")
abstract class AmRetrofit {
  factory AmRetrofit(Dio dio, {String baseUrl}) = _AmRetrofit;

  @GET("me/recent/played/tracks")
  Future<AmTracksResponse> getRecentlyPlayedTracks(
    @Query("include") List<String>? include,
    @Query("l") String? l,
    @Query("limit") int? limit,
    @Query("offset") int? offset,
    @Query("extend") List<String>? extend,
    @Query("types") List<String> types,
  );
}
