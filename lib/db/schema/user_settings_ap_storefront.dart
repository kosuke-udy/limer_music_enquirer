import 'package:isar/isar.dart';

part 'user_settings_ap_storefront.g.dart';

@embedded
class ApStorefrontUserSettings {
  ApStorefrontUserSettings();

  int? languageTagIndex;
  ApStorefront? data;

  String? get id => data?.id;
  String? get languageTag => data?.supportedLanguageTags?[languageTagIndex!];

  factory ApStorefrontUserSettings.fromJson(Map<String, dynamic> json) {
    final data = ApStorefront.fromJson(json);
    return ApStorefrontUserSettings()
      ..data = data
      ..languageTagIndex = data.defaultLanguageTagIndex;
  }
}

@embedded
class ApStorefront {
  ApStorefront();

  String? id;
  String? name;
  int? defaultLanguageTagIndex;
  List<String>? supportedLanguageTags;

  @Enumerated(EnumType.ordinal32)
  ExplicitContentPolicy? explicitContentPolicy;

  String? get defaultLanguageTag =>
      supportedLanguageTags?[defaultLanguageTagIndex!];

  factory ApStorefront.fromJson(Map<String, dynamic> json) {
    final supportedTags =
        (json["attributes"]['supportedLanguageTags'] as List<dynamic>)
            .cast<String>();
    final defaultIndex =
        supportedTags.indexOf(json["attributes"]['defaultLanguageTag']);

    return ApStorefront()
      ..supportedLanguageTags = supportedTags
      ..defaultLanguageTagIndex = defaultIndex
      ..explicitContentPolicy = ExplicitContentPolicy.fromJson(
          json["attributes"]['explicitContentPolicy'])
      ..name = json["attributes"]['name']
      ..id = json['id'];
  }
}

enum ExplicitContentPolicy {
  allowed,
  optIn,
  prohibited,
  unknown;

  factory ExplicitContentPolicy.fromJson(String jsonValue) {
    switch (jsonValue) {
      case 'allowed':
        return ExplicitContentPolicy.allowed;
      case 'optIn':
        return ExplicitContentPolicy.optIn;
      case 'prohibited':
        return ExplicitContentPolicy.prohibited;
      default:
        return ExplicitContentPolicy.unknown;
    }
  }
}
