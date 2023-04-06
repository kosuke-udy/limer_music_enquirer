part of converter;

class NotConvertableTypeError extends Error {
  final Type type;

  NotConvertableTypeError(this.type);

  @override
  String toString() {
    if (type == Null) {
      return "NotConvertableTypeError: type is null";
    } else {
      return "NotConvertableTypeError: type is $type";
    }
  }
}

class NotSupportedTypeError extends Error {
  final String? typeData;

  NotSupportedTypeError(this.typeData);

  @override
  String toString() {
    if (typeData == null) {
      return "NotSupportedTypeError: type is null";
    } else {
      return "NotSupportedTypeError: type is $typeData";
    }
  }
}
