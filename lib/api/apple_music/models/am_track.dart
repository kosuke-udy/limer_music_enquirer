import 'package:flutter/material.dart';

import 'am_artwork.dart';

@immutable
class AmTrack {
  final String id;
  final String name;
  final String artistName;
  final AmArtwork artwork;
  final String? composerName;

  bool get hasComposer => composerName != null && composerName!.isNotEmpty;

  const AmTrack({
    required this.id,
    required this.name,
    required this.artistName,
    required this.artwork,
    this.composerName,
  });

  @override
  factory AmTrack.fromJson(Map<String, dynamic> json) {
    return AmTrack(
      id: json['id'],
      name: json['attributes']['name'],
      artistName: json['attributes']['artistName'],
      artwork: AmArtwork.fromJson(json['attributes']['artwork']),
      composerName: json['attributes']['composerName'],
    );
  }
}

@immutable
class AmTracksResponse {
  final List<AmTrack> data;

  const AmTracksResponse({required this.data});

  factory AmTracksResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> rawData = json['data'];
    final List<AmTrack> data =
        rawData.map((dynamic e) => AmTrack.fromJson(e)).toList();
    return AmTracksResponse(data: data);
  }
}
