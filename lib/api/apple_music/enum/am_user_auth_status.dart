enum AmUserAuthStatus {
  authorized("authorized"),
  notDetermined("notDetermined"),
  restricted("restricted"),
  denied("denied");

  final String value;

  const AmUserAuthStatus(this.value);

  static AmUserAuthStatus fromString(String value) {
    switch (value) {
      case "authorized":
        return AmUserAuthStatus.authorized;
      case "notDetermined":
        return AmUserAuthStatus.notDetermined;
      case "restricted":
        return AmUserAuthStatus.restricted;
      case "denied":
        return AmUserAuthStatus.denied;
      default:
        throw Exception("Invalid AmUserAuthStatus: $value");
    }
  }

  Exception toException() {
    return Exception("Apple Music User Authorization Status: $value");
  }
}
