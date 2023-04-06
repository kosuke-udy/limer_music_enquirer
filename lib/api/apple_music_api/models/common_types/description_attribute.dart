import 'package:freezed_annotation/freezed_annotation.dart';

part 'description_attribute.freezed.dart';
part 'description_attribute.g.dart';

@freezed
class DescriptionAttribute with _$DescriptionAttribute {
  const factory DescriptionAttribute({
    String? short,
    required String standard,
  }) = _DescriptionAttribute;

  factory DescriptionAttribute.fromJson(Map<String, dynamic> json) =>
      _$DescriptionAttributeFromJson(json);
}
