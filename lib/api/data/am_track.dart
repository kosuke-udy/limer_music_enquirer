class AmTrack {
  final String id;
  final String name;
  final String artistName;

  AmTrack({required this.id, required this.name, required this.artistName});

  factory AmTrack.fromJson(Map<String, dynamic> json) {
    final String id = json['id'];
    final String name = json['attributes']['name'];
    final String artistName = json['attributes']['artistName'];
    return AmTrack(id: id, name: name, artistName: artistName);
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
