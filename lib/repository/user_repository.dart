abstract class UserRepository {
  const UserRepository();

  String get username;
  String get password;

  Future<String> authenticate(String username, String password);

  //Future<bool> register(String phone);

  Future<void> logout();
}
