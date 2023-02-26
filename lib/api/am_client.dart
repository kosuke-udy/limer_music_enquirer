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

  Future<AmApiStatus> testDevToken() async {
    final response = await state.get("test");
    return AmApiStatus.fromCode(
        response.statusCode ?? AmApiStatus.noStatus.code);
  }
}

enum AmApiStatus {
  unknownStatusCode(0),
  noStatus(1),
  ok(200),
  created(201),
  accepted(202),
  noContent(204),
  movedPermanently(301),
  found(302),
  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  methodNotAllowed(405),
  conflict(409),
  payloadTooLarge(413),
  uriTooLong(414),
  tooManyRequests(429),
  internalServerError(500),
  notImplemented(501),
  serviceUnavailable(503);

  final int code;

  const AmApiStatus(this.code);

  factory AmApiStatus.fromCode(int code) {
    try {
      final ret = AmApiStatus.values.firstWhere((e) => e.code == code);
      return ret;
    } catch (e) {
      print(e.toString());
      return AmApiStatus.unknownStatusCode;
    }
  }
}
