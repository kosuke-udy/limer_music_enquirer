import 'package:fpdart/fpdart.dart';

class MetadataInfo<T> {
  final T value;
  final bool isVisible;

  MetadataInfo(this.value, this.isVisible);
}

List<MetadataInfo<T>> getMetadataInfoList<T>(
    List<T> values, List<bool> visibilities) {
  return values
      .asMap()
      .entries
      .map((e) => MetadataInfo(e.value, visibilities[e.key]))
      .toList();
}

Tuple2<List<T>, List<bool>> getMetadataValuesAndVisibilities<T>(
    List<MetadataInfo<T>> items) {
  return Tuple2(
    items.map((e) => e.value).toList(),
    items.map((e) => e.isVisible).toList(),
  );
}
