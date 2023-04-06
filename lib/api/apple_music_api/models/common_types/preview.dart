import 'package:freezed_annotation/freezed_annotation.dart';

import 'artwork.dart';

part 'preview.freezed.dart';

@freezed
class Preview with _$Preview {
  const factory Preview({
    Artwork? artwork,
    required String url,
    String? hlsUrl,
  }) = _Preview;

  factory Preview.fromJson(Map<String, dynamic> json) {
    return Preview(
      artwork: json['artwork'] == null
          ? null
          : Artwork.fromJson(json['artwork'] as Map<String, dynamic>),
      url: json['url'] as String,
      hlsUrl: json['hlsUrl'] as String?,
    );
  }
}
