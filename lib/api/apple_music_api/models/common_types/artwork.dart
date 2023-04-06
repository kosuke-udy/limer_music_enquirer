import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'artwork.freezed.dart';

@freezed
class Artwork with _$Artwork {
  const factory Artwork({
    required String url,
    int? width,
    int? height,
    Color? bgColor,
    Color? textColor1,
    Color? textColor2,
    Color? textColor3,
    Color? textColor4,
  }) = _Artwork;

  factory Artwork.fromJson(Map<String, dynamic> json) {
    return Artwork(
      url: json['url'] as String,
      width: json['width'] as int?,
      height: json['height'] as int?,
      bgColor: _hexToColor(json['bgColor'] as String?),
      textColor1: _hexToColor(json['textColor1'] as String?),
      textColor2: _hexToColor(json['textColor2'] as String?),
      textColor3: _hexToColor(json['textColor3'] as String?),
      textColor4: _hexToColor(json['textColor4'] as String?),
    );
  }
}

Color? _hexToColor(String? hex) {
  if (hex == null) return null;
  return Color(int.parse("ff$hex", radix: 16));
}

extension ArtworkExtension on Artwork {
  String getArtworkUrl({int? size}) {
    if (isUsers) {
      return url;
    }

    final heightRatio = height! / width!;

    late int w, h;
    if (size != null) {
      if (heightRatio < 1) {
        w = size;
        h = (size * heightRatio).round();
      } else {
        h = size;
        w = (size / heightRatio).round();
      }
    } else {
      w = width!;
      h = height!;
    }
    return _replaceWidthAndHeight(url, w, h);
  }

  String _replaceWidthAndHeight(String encodedString, int width, int height) {
    return encodedString
        .replaceAll("{w}", width.toString())
        .replaceAll("{h}", height.toString());
  }

  String get url100 => getArtworkUrl(size: 100);
  String get url300 => getArtworkUrl(size: 300);
  String get url500 => getArtworkUrl(size: 500);
  String get url1000 => getArtworkUrl(size: 1000);
  String get urlFull => getArtworkUrl();

  bool get isUsers => width == null || height == null;
}
