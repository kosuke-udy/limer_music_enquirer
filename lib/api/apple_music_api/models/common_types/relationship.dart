import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter/converter.dart';
import '../base_abstracts.dart';

part 'relationship.freezed.dart';

@freezed
class Relationship<T extends ResourceKind> with _$Relationship<T> {
  const factory Relationship({
    String? href,
    String? next,
    required List<T> data,
  }) = _Relationship<T>;

  factory Relationship.fromJson(Map<String, dynamic> json) {
    return Relationship(
      href: json["href"],
      next: json["next"],
      data: convertToList(json),
    );
  }
}
