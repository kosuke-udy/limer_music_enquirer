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
  void Function(Object response) logger =
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
    bool logEnabled = false,
    void Function(Object response)? logger,
  }) {
    dio.options = BaseOptions(
      headers: {
        "Authorization": "Bearer $devToken",
        "Music-User-Token": userToken,
      },
    );

    _isInitialized = true;
    if (userToken != null) _isAuthorizedByUser = true;

    this.logEnabled = logEnabled;
    if (logger != null) this.logger = logger;
  }

  void setBaseQueryParameters(Map<String, dynamic> queryParameters) {
    _client.dio.options.queryParameters = queryParameters;
  }

  Future<List<T>> fetch<T extends ResourceKind>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final response = await dio.get(
      path,
      queryParameters: queryParameters,
    );
    return convertToList(response.data);
  }
}