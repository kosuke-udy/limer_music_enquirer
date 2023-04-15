library client;

import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';

import '../converter/converter.dart';
import '../models/models.dart';

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

  Future<List<T>> fetchResource<T extends ResourceKind>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final response = await dio.get(
      path,
      queryParameters: queryParameters,
    );

    if (logEnabled) logger(response);

    return convertToList(response.data);
  }

  Future<List<dynamic>> fetch(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
      );

      if (logEnabled) logger(response);

      return response.data["data"] as List<dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
