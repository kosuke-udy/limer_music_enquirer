enum UserAuthStatus {
  authorized("authorized"),
  notDetermined("notDetermined"),
  restricted("restricted"),
  denied("denied");

  final String value;

  const UserAuthStatus(this.value);

  static UserAuthStatus fromString(String value) {
    switch (value) {
      case "authorized":
        return UserAuthStatus.authorized;
      case "notDetermined":
        return UserAuthStatus.notDetermined;
      case "restricted":
        return UserAuthStatus.restricted;
      case "denied":
        return UserAuthStatus.denied;
      default:
        throw Exception("Invalid UserAuthStatus: $value");
    }
  }

  Exception toException() {
    return Exception("Apple Music User Authorization Status: $value");
  }
}
