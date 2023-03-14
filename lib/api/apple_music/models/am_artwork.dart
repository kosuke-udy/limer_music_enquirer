class AmArtwork {
  final int width;
  final int height;
  final String baseUrl;
  final String? bgColor;
  final String? textColor1;
  final String? textColor2;
  final String? textColor3;
  final String? textColor4;

  late final String url100;
  late final String url300;
  late final String url500;
  late final String url1000;
  late final String urlFull;

  AmArtwork({
    required this.baseUrl,
    required this.width,
    required this.height,
    this.bgColor,
    this.textColor1,
    this.textColor2,
    this.textColor3,
    this.textColor4,
  }) {
    String getAmArtworkUrl({int? size}) {
      late int w, h;
      if (size != null) {
        if (width > height) {
          w = size;
          h = (height * size / width).round();
        } else {
          h = size;
          w = (width * size / height).round();
        }
      } else {
        w = width;
        h = height;
      }
      return "$baseUrl/${w}x${h}bb.jpg";
    }

    url100 = getAmArtworkUrl(size: 100);
    url300 = getAmArtworkUrl(size: 300);
    url500 = getAmArtworkUrl(size: 500);
    url1000 = getAmArtworkUrl(size: 1000);
    urlFull = getAmArtworkUrl();
  }

  factory AmArtwork.fromJson(Map<String, dynamic> json) {
    return AmArtwork(
      baseUrl: json['url'].toString().replaceAll("/{w}x{h}bb.jpg", ""),
      width: json['width'],
      height: json['height'],
      bgColor: json['bgColor'],
      textColor1: json['textColor1'],
      textColor2: json['textColor2'],
      textColor3: json['textColor3'],
      textColor4: json['textColor4'],
    );
  }
}
