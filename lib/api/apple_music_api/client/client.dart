library client;

import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../utils/app_logger.dart';
import '../models/models.dart';
import 'response.dart';

part 'developer_token.dart';

class AppleMusicApiClient {
  static final _client = AppleMusicApiClient._();

  /* ---------- Properties ---------- */

  final Dio dio = Dio();

  bool logEnabled = false;
  void Function(Response response) logger =
      (response) => log(response.toString());

  bool _isInitialized = false;
  get isInitialized => _isInitialized;

  bool _isAuthorizedByUser = false;
  get isAuthorizedByUser => _isAuthorizedByUser;

  /* ---------- Constructor ---------- */

  AppleMusicApiClient._();

  factory AppleMusicApiClient() => _client;

  /* ---------- Public Methods ---------- */

  void initialize({
    required String devToken,
    String? userToken,
    Map<String, dynamic>? queryParameters,
    bool logEnabled = false,
    void Function(Response response)? logger,
  }) {
    dio.options = BaseOptions(
      headers: {
        "Authorization": "Bearer $devToken",
        "Music-User-Token": userToken,
      },
      queryParameters: queryParameters,
    );

    _isInitialized = true;
    if (userToken != null) _isAuthorizedByUser = true;

    this.logEnabled = logEnabled;
    if (logger != null) this.logger = logger;
  }

  void setBaseQueryParameters(Map<String, dynamic> queryParameters) {
    _client.dio.options.queryParameters = queryParameters;
  }

  Future<PagenatedResourceCollectionResponse<T>> fetch<T extends ResourceKind>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final logger = AppLogger.get("AppleMusicApiClient.fetch");

    final response = await TaskEither<Object, Response>(
      () async {
        try {
          final result = await dio.get(
            path.contains("https://api.music.apple.com")
                ? path
                : "https://api.music.apple.com$path",
            queryParameters: queryParameters,
          );
          return Right(result);
        } catch (e) {
          return Left(e);
        }
      },
    ).run().then((either) => either.getOrElse(
          (l) {
            logger.warning([
              "Request: GET $path",
              l.toString(),
            ]);
            throw l;
          },
        ));

    return PagenatedResourceCollectionResponse<T>.fromJson(response);
  }
}
