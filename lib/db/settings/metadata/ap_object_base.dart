abstract class ApMetadataEnumBase {
  bool get isCatalogs;
}

abstract class ApMetadataInfoBase<T extends ApMetadataEnumBase> {
  T get type;
  bool get isVisible;
  set isVisible(bool value);
}
