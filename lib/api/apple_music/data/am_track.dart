import 'package:freezed_annotation/freezed_annotation.dart';

part 'am_track.freezed.dart';

@freezed
abstract class AmTrack with _$AmTrack {
  const factory AmTrack({
    required String id,
    required String name,
    required String artistName,
    required String artworkUrlBase,
    required int artworkHeight,
    required int artworkWidth,
    String? composerName,
  }) = _AmTrack;

  @override
  factory AmTrack.fromJson(Map<String, dynamic> json) {
    return AmTrack(
      id: json['id'],
      name: json['attributes']['name'],
      artistName: json['attributes']['artistName'],
      artworkUrlBase: json['attributes']['artwork']['url']
          .toString()
          .replaceAll("/{w}x{h}bb.jpg", ""),
      artworkHeight: json['attributes']['artwork']['height'],
      artworkWidth: json['attributes']['artwork']['width'],
      composerName: json['attributes']['composerName'],
    );
  }
}

class AmTracksResponse {
  List<AmTrack> data;

  AmTracksResponse({required this.data});

  factory AmTracksResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> rawData = json['data'];
    final List<AmTrack> data =
        rawData.map((dynamic e) => AmTrack.fromJson(e)).toList();
    return AmTracksResponse(data: data);
  }
}

String getAmArtworkUrl(AmTrack track, {int? maxLength}) {
  late int w, h;
  if (maxLength != null) {
    if (track.artworkWidth > track.artworkHeight) {
      w = maxLength;
      h = (track.artworkHeight * maxLength / track.artworkWidth).round();
    } else {
      h = maxLength;
      w = (track.artworkWidth * maxLength / track.artworkHeight).round();
    }
  } else {
    w = track.artworkWidth;
    h = track.artworkHeight;
  }
  return "${track.artworkUrlBase}/${w}x${h}bb.jpg";
}
