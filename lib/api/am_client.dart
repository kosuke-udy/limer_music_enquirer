import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'am_dev_token.dart';

part 'am_client.g.dart';

@Riverpod(keepAlive: true)
class AmClient extends _$AmClient {
  @override
  Dio build() {
    final dio = Dio(BaseOptions(
      baseUrl: "https://api.music.apple.com/v1/",
    ));

    // Add the token to the header
    final token = ref.watch(amDevTokenProvider);
    dio.options.headers = {"Authorization": "Bearer $token"};

    // Log requests and responses
    // dio.interceptors.add(LogInterceptor());

    return dio;
  }
}
