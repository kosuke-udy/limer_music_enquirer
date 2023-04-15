import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converter/converter.dart';
import '../base_abstracts.dart';

part 'view.freezed.dart';

abstract class View<T extends ResourceKind> {
  String? get href;
  String? get next;
  List<T> get data;
}

abstract class ViewAttributes {}

@freezed
class TitledView<T extends ResourceKind>
    with _$TitledView<T>
    implements View<T> {
  const factory TitledView({
    String? href,
    String? next,
    required TitledViewAttributes attributes,
    required List<T> data,
  }) = _TitledView<T>;

  factory TitledView.fromJson(Map<String, dynamic> json) {
    return TitledView(
      href: json["href"],
      next: json["next"],
      attributes: TitledViewAttributes.fromJson(json["attributes"]),
      data: convertToList(json),
    );
  }
}

@freezed
class TitledViewAttributes extends ViewAttributes with _$TitledViewAttributes {
  const factory TitledViewAttributes({
    required String title,
  }) = _TitledViewAttributes;

  factory TitledViewAttributes.fromJson(Map<String, dynamic> json) {
    return TitledViewAttributes(
      title: json["title"],
    );
  }
}
