import 'package:freezed_annotation/freezed_annotation.dart';

part 'storefronts_attributes.freezed.dart';
part 'storefronts_attributes.g.dart';

@freezed
class StorefrontsAttributes with _$StorefrontsAttributes {
  const factory StorefrontsAttributes({
    required String defaultLanguageTag,
    required ExplicitContentPolicy explicitContentPolicy,
    required String name,
    required List<String> supportedLanguageTags,
  }) = _StorefrontsAttributes;

  factory StorefrontsAttributes.fromJson(Map<String, dynamic> json) =>
      _$StorefrontsAttributesFromJson(json);
}

enum ExplicitContentPolicy {
  allowed("allowed"),
  optIn("opt-in"),
  prohibited("prohibited"),
  unknown("unknown");

  final String jsonValue;

  const ExplicitContentPolicy(this.jsonValue);

  factory ExplicitContentPolicy.fromJson(String jsonValue) {
    switch (jsonValue) {
      case 'allowed':
        return ExplicitContentPolicy.allowed;
      case 'opt-in':
        return ExplicitContentPolicy.optIn;
      case 'prohibited':
        return ExplicitContentPolicy.prohibited;
      case 'unknown':
        return ExplicitContentPolicy.unknown;
      default:
        throw Exception('Unknown ExplicitContentPolicy: $jsonValue');
    }
  }
}
