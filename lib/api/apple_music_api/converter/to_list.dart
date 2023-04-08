part of converter;

List<T> convertToList<T extends ResourceKind>(Map<String, dynamic> json) {
  final list = <T>[];
  for (final e in json["data"] as List<dynamic>) {
    list.add(convertToResourceKind<T>(e as Map<String, dynamic>));
  }
  return list;
}
