part of converter;

List<T> convertToList<T extends ResourceKind>(Map<String, dynamic> json) {
  final list = <T>[];
  for (final e in json["data"] as List<dynamic>) {
    final data = e as Map<String, dynamic>;
    if (ResourceType.jsonValues.contains(data["type"])) {
      list.add(convertToResourceKind<T>(e));
    } else {
      break;
    }
  }
  return list;
}
