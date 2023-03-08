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
