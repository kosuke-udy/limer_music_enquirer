part of converter;

List<T> convertToList<T extends ResourceKind>(Map<String, dynamic> json) {
  final list = <T>[];
  for (final Map<String, dynamic> e in json["data"] as List<dynamic>) {
    if (e["attributes"] != null) {
      list.add(convertToResourceKind<T>(e));
    }
  }
  return list;
}
