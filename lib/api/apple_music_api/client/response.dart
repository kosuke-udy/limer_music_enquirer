import 'package:dio/dio.dart';

import '../converter/converter.dart';
import '../models/models.dart';

class ResourceCollectionResponse<T extends ResourceKind> {
  final List<T> data;

  ResourceCollectionResponse({
    required this.data,
  });

  factory ResourceCollectionResponse.fromJson(
    Response response,
  ) {
    return ResourceCollectionResponse(
      data: convertToList(response.data),
    );
  }
}

class PagenatedResourceCollectionResponse<T extends ResourceKind> {
  final List<T> data;
  final String? next;

  PagenatedResourceCollectionResponse({
    required this.data,
    required this.next,
  });

  factory PagenatedResourceCollectionResponse.fromJson(
    Response response,
  ) {
    return PagenatedResourceCollectionResponse(
      data: convertToList(response.data),
      next: response.data["next"],
    );
  }
}
