abstract class UserLocalSource {
  Future setToken(String value);

  Future<String?> getToken();

  Future setUserID(String value);

  Future<String> getUserID();

  Future setUsername(String value);

  Future<String> getUsername();

  Future<void> logout();
}
