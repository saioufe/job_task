import 'package:job_task/repository/user_repository.dart';

class TestUserRepository extends UserRepository {
  final String fakeUsername;
  final String fakePassword;
  final bool succ;

  const TestUserRepository({this.fakeUsername, this.fakePassword, this.succ});

  @override
  Future<String> authenticate(String username, String password) {
    return Future<String>.delayed(const Duration(seconds: 1), succ.toString);
  }

  @override
  Future<void> logout() => Future.delayed(const Duration(seconds: 1));

  @override
  String get password => throw UnimplementedError();

  @override
  String get username => throw UnimplementedError();
}
