enum PlaylistType {
  editorial("editorial"),
  external("external"),
  personalMix("personal-mix"),
  replay("replay"),
  userShared("user-shared");

  final String jsonValue;

  const PlaylistType(this.jsonValue);

  static PlaylistType fromJson(String value) {
    return PlaylistType.values.firstWhere((e) => e.jsonValue == value);
  }
}
